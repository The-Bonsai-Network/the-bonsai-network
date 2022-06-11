import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/injection.dart';
import 'package:bonsai_network/domain/user_profile.dart';
import 'package:bonsai_network/foundation/theme.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/oauth_failure_dialog.dart';
import 'package:bonsai_network/application/supplementary_sidemenu_notifier.dart';
import 'package:bonsai_network/presentation/routes/app_router.dart';

class LinkedInPage extends StatelessWidget {
  const LinkedInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<SupplementarySidemenuNotifier>(),
      child: const _LinkedInPage(),
    );
  }
}

class _LinkedInPage extends StatefulWidget {
  const _LinkedInPage({Key? key}) : super(key: key);

  @override
  State createState() => _LinkedInPageState();
}

class _LinkedInPageState extends State<_LinkedInPage> {
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

    Future.delayed(const Duration(seconds: 2)).then((_) {
      setState(() {
        initialLoad = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Consumer<SupplementarySidemenuNotifier>(
      builder: (context, model, _) => Stack(
        children: [
          LinkedInUserWidget(
            destroySession: model.logoutUser,
            redirectUrl: dotenv.env['LINKEDIN_REDIRECT_URI'],
            clientId: dotenv.env['LINKEDIN_CLIENT_ID'],
            clientSecret: dotenv.env['LINKEDIN_CLIENT_SECRET'],
            useVirtualDisplay: true,
            projection: const [
              ProjectionParameters.id,
              ProjectionParameters.localizedFirstName,
              ProjectionParameters.localizedLastName,
              ProjectionParameters.firstName,
              ProjectionParameters.lastName,
              ProjectionParameters.profilePicture,
            ],
            onError: (final UserFailedAction e) {
              showDialog(
                context: context,
                builder: (context) => const OAuthFailureDialog(
                  svgName: 'assets/images/oauth/linkedin.svg',
                ),
              );
            },
            onGetUserProfile: (final UserSucceededAction linkedInUser) async {
              setState(() {
                model.loading = true;
              });

              user = UserProfile(
                userId: linkedInUser.user.userId,
                firstName: linkedInUser.user.firstName?.localized?.label ?? '',
                lastName: linkedInUser.user.lastName?.localized?.label ?? '',
                email: linkedInUser
                        .user.email?.elements?[0].handleDeep?.emailAddress ??
                    '',
                profilePaths: [
                  linkedInUser.user.profilePicture?.displayImageContent
                          ?.elements?[0].identifiers?[0].identifier ??
                      '',
                ],
              );

              final firebaseAuthUser = await auth
                  .signInWithEmailAndPassword(
                email: user?.email ?? '',
                password: linkedInUser.user.userId ?? '',
              )
                  .onError(
                (e, _) {
                  showDialog(
                    context: context,
                    builder: (context) => const OAuthFailureDialog(
                      svgName: 'assets/images/oauth/linkedin.svg',
                    ),
                  );

                  AutoRouter.of(context).pop();

                  throw e ?? {};
                },
              );

              final firestoreUser = user?.toFirestore() ?? {};

              if (firestoreUser.isNotEmpty) {
                await secureStorage.write(
                  key: 'bonsai-oauth-token-type',
                  value: 'linkedin',
                );

                await secureStorage.write(
                  key: 'bonsai-linkedin-token',
                  value: linkedInUser.user.token.accessToken ?? '',
                );

                await secureStorage.write(
                  key: 'bonsai-token-expiry',
                  value: DateTime.fromMillisecondsSinceEpoch(
                          (linkedInUser.user.token.expiresIn ?? 0) * 1000)
                      .toIso8601String(),
                );

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
                model.logoutUser = false;
                model.loading = false;
                AutoRouter.of(context).replace(const DashboardRoute());
              });
            },
          ),
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
}
