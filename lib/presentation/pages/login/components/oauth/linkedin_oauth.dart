import 'package:auto_route/auto_route.dart';
import 'package:bonsai_network/presentation/routes/app_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:linkedin_login/linkedin_login.dart';

import 'package:bonsai_network/injection.dart';
import 'package:bonsai_network/domain/user_profile.dart';
import 'package:bonsai_network/foundation/theme.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/oauth_failure_dialog.dart';

class LinkedInPage extends StatefulWidget {
  const LinkedInPage({Key? key}) : super(key: key);

  @override
  State createState() => _LinkedInPageState();
}

class _LinkedInPageState extends State<LinkedInPage> {
  UserProfile? user;
  bool logoutUser = false;
  bool isLoading = false;

  final db = getIt<FirebaseFirestore>();
  final secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    setState(() {
      isLoading = false;
    });

    Future.delayed(const Duration(seconds: 2)).then((_) {
      setState(() {
        isLoading = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        LinkedInUserWidget(
          destroySession: logoutUser,
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
          onGetUserProfile: (final UserSucceededAction linkedInUser) async {
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

            final firestoreUser = user?.toFirestore() ?? {};

            if (firestoreUser.isNotEmpty) {
              await secureStorage.write(
                key: 'bonsai-oauth-token-type',
                value: 'linkedin',
              );

              await secureStorage.write(
                key: 'bonsai-token',
                value: linkedInUser.user.token.accessToken ?? '',
              );

              await secureStorage.write(
                key: 'bonsai-token-expiry',
                value: '${linkedInUser.user.token.expiresIn ?? 0}',
              );

              final existingUser = await db
                  .collection('users')
                  .where('email', isEqualTo: user?.email ?? '')
                  .get();

              if (existingUser.docs.isNotEmpty) {
                db
                    .collection('users')
                    .doc(existingUser.docs.last.id)
                    .update(firestoreUser);
              } else {
                db.collection("users").add(firestoreUser);
              }
            }

            setState(() {
              logoutUser = false;

              AutoRouter.of(context).replace(const DashboardRoute());
            });
          },
        ),
        if (!isLoading) ...[
          Center(
            child: CircularProgressIndicator(
              color: ThemeColor.primaryGreen.color,
              strokeWidth: 2.0,
            ),
          ),
        ]
      ],
    );
  }
}

class LinkedInAuthCodePage extends StatefulWidget {
  const LinkedInAuthCodePage({final Key? key}) : super(key: key);

  @override
  State createState() => _LinkedInAuthCodePageState();
}

class _LinkedInAuthCodePageState extends State<LinkedInAuthCodePage> {
  AuthCodeObject? authorizationCode;
  bool logoutUser = false;

  @override
  Widget build(final BuildContext context) {
    return LinkedInButtonStandardWidget(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (final BuildContext context) => LinkedInAuthCodeWidget(
              destroySession: logoutUser,
              redirectUrl: dotenv.env['LINKEDIN_REDIRECT_URI'],
              clientId: dotenv.env['LINKEDIN_CLIENT_ID'],
              onError: (final AuthorizationFailedAction e) {
                showDialog(
                  context: context,
                  builder: (context) => const OAuthFailureDialog(
                      svgName: 'assets/images/oauth/linkedin.svg'),
                );
              },
              onGetAuthCode: (final AuthorizationSucceededAction response) {
                authorizationCode = AuthCodeObject(
                  code: response.codeResponse.code ?? '',
                  state: response.codeResponse.state ?? '',
                );

                setState(() {});

                Navigator.pop(context);
              },
            ),
            fullscreenDialog: true,
          ),
        );
      },
    );
  }
}

class AuthCodeObject {
  AuthCodeObject({required this.code, required this.state});

  final String code;
  final String state;
}
