import 'dart:io';
import 'package:bonsai_network/foundation/html_shim.dart'
    if (dart.library.html) 'dart:html' show window;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:auto_route/auto_route.dart';
import 'package:bonsai_network/presentation/routes/app_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:bonsai_network/domain/user_profile.dart';
import 'package:bonsai_network/injection.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/oauth_failure_dialog.dart';

class AppleSignInButton extends StatefulWidget {
  const AppleSignInButton({Key? key}) : super(key: key);

  @override
  State<AppleSignInButton> createState() => _AppleSignInButtonState();
}

class _AppleSignInButtonState extends State<AppleSignInButton> {
  UserProfile? user;
  bool initialLoad = false;

  final auth = getIt<FirebaseAuth>();

  final db = getIt<FirebaseFirestore>();

  final secureStorage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return SignInWithAppleButton(
      iconAlignment: IconAlignment.center,
      style: SignInWithAppleButtonStyle.white,
      onPressed: () async {
        final clientId = dotenv.env['APPL_SERVICE_ID'] ?? '';
        final String redirectUri = dotenv.env['APPL_REDIRECT_URI'] ?? '';

        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          webAuthenticationOptions: WebAuthenticationOptions(
            clientId: clientId,
            redirectUri: Uri.parse(redirectUri),
          ),
        );

        List<String> providers = [];

        if (credential.email?.isNotEmpty ?? false) {
          providers =
              await auth.fetchSignInMethodsForEmail(credential.email ?? '');
        }

        if (providers.isNotEmpty) {
          showDialog(
            context: context,
            builder: (context) => const OAuthFailureDialog(
              svgName: 'assets/images/oauth/apple.svg',
            ),
          );

          return;
        }

        final oAuthProvider = OAuthProvider('apple.com');
        final firebaseCredential = oAuthProvider.credential(
          idToken: String.fromCharCodes(
            credential.identityToken?.codeUnits ?? [],
          ),
          accessToken: String.fromCharCodes(
            credential.authorizationCode.codeUnits,
          ),
        );

        final firebaseAuthUser =
            await auth.signInWithCredential(firebaseCredential).onError(
          (e, _) {
            showDialog(
              context: context,
              builder: (context) => const OAuthFailureDialog(
                svgName: 'assets/images/oauth/apple.svg',
              ),
            );

            throw e ?? {};
          },
        );

        user = UserProfile(
          userId: credential.userIdentifier,
          firstName: credential.givenName,
          lastName: credential.familyName,
          email: credential.email,
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
          AutoRouter.of(context).replace(const DashboardRoute());
        });
      },
    );
  }
}
