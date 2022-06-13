import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart' as p;

import 'package:bonsai_network/injection.dart';
import 'package:bonsai_network/domain/user_profile.dart';
import 'package:bonsai_network/foundation/theme.dart';
import 'package:bonsai_network/application/supplementary_sidemenu_notifier.dart';
import 'package:bonsai_network/presentation/routes/app_router.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/oauth_failure_dialog.dart';

class GooglePage extends StatelessWidget {
  const GooglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return p.ChangeNotifierProvider(
      create: (context) => getIt<SupplementarySidemenuNotifier>(),
      child: const _GooglePage(),
    );
  }
}

class _GooglePage extends ConsumerStatefulWidget {
  const _GooglePage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _GooglePageState();
}

class _GooglePageState extends ConsumerState<_GooglePage> {
  UserProfile? user;
  bool initialLoad = false;

  final auth = getIt<FirebaseAuth>();
  final db = getIt<FirebaseFirestore>();
  final secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    setState(() {
      initialLoad = false;
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final model = context.read<SupplementarySidemenuNotifier>();

      _signInWithGoogle(model);
    });

    Future.delayed(const Duration(seconds: 2)).then((_) {
      setState(() {
        initialLoad = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return p.Consumer<SupplementarySidemenuNotifier>(
      builder: (context, model, _) => Stack(
        children: [
          if (model.loading || !initialLoad) ...[
            Center(
              child: CircularProgressIndicator(
                color: ThemeColor.primaryGreen.color,
                strokeWidth: 2.0,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _signInWithGoogle(
    SupplementarySidemenuNotifier model,
  ) async {
    setState(() {
      model.loading = true;
    });

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    setState(() {
      if (googleUser == null) {
        AutoRouter.of(context).pop();
      }
    });

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final providers =
        await auth.fetchSignInMethodsForEmail(googleUser?.email ?? '');

    if (providers.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => const OAuthFailureDialog(
          svgName: 'assets/images/oauth/google.svg',
        ),
      );

      return;
    }

    final firebaseAuthUser =
        await auth.signInWithCredential(credential).onError(
      (e, _) {
        showDialog(
          context: context,
          builder: (context) => const OAuthFailureDialog(
            svgName: 'assets/images/oauth/google.svg',
          ),
        );

        throw e ?? {};
      },
    );

    user = UserProfile(
      userId: firebaseAuthUser.user?.uid ?? '',
      displayName: firebaseAuthUser.user?.displayName ?? '',
      email: firebaseAuthUser.user?.email ?? '',
      profilePaths: [
        firebaseAuthUser.user?.photoURL ?? '',
      ],
    );

    final firestoreUser = user?.toFirestore() ?? {};

    if (firestoreUser.isNotEmpty) {
      final existingUser = await db
          .collection('users')
          .where('email', isEqualTo: user?.email ?? '')
          .get();

      if (existingUser.docs.isNotEmpty) {
        await db
            .collection('users')
            .doc(firebaseAuthUser.user?.uid ?? '')
            .update(firestoreUser);
      } else {
        await db
            .collection("users")
            .doc(firebaseAuthUser.user?.uid ?? '')
            .set(firestoreUser);
      }
    }

    setState(() {
      model.loading = false;
      AutoRouter.of(context).replace(const DashboardRoute());
    });
  }
}
