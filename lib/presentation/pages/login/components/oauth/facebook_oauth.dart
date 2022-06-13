import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart' as p;

import 'package:bonsai_network/injection.dart';
import 'package:bonsai_network/domain/user_profile.dart';
import 'package:bonsai_network/foundation/theme.dart';
import 'package:bonsai_network/application/supplementary_sidemenu_notifier.dart';
import 'package:bonsai_network/presentation/routes/app_router.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/oauth_failure_dialog.dart';

class FacebookPage extends StatelessWidget {
  const FacebookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return p.ChangeNotifierProvider(
      create: (context) => getIt<SupplementarySidemenuNotifier>(),
      child: const _FacebookPage(),
    );
  }
}

class _FacebookPage extends ConsumerStatefulWidget {
  const _FacebookPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _FacebookPageState();
}

class _FacebookPageState extends ConsumerState<_FacebookPage> {
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

      _signInWithFacebook(model);
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

  void _signInWithFacebook(
    SupplementarySidemenuNotifier model,
  ) async {
    setState(() {
      model.loading = true;
    });

    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: [
        'email',
        'public_profile',
      ],
    );

    setState(() {
      if (loginResult.status != LoginStatus.success) {
        AutoRouter.of(context).pop();
      }
    });

    final userData = await FacebookAuth.i.getUserData(
      fields: 'name,email,picture.width(200)',
    );

    final OAuthCredential credential =
        FacebookAuthProvider.credential(loginResult.accessToken?.token ?? '');

    if (userData['email'] != null) {
      final providers =
          await auth.fetchSignInMethodsForEmail(userData['email']);

      if (providers.isNotEmpty) {
        showDialog(
          context: context,
          builder: (context) => const OAuthFailureDialog(
            svgName: 'assets/images/oauth/facebook.svg',
          ),
        );

        return;
      }
    }

    final firebaseAuthUser =
        await auth.signInWithCredential(credential).onError(
      (e, _) {
        showDialog(
          context: context,
          builder: (context) => const OAuthFailureDialog(
            svgName: 'assets/images/oauth/facebook.svg',
          ),
        );

        setState(() {
          model.loading = false;
        });

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
