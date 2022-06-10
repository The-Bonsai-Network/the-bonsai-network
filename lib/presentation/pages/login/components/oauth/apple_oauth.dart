import 'dart:io';
import 'package:bonsai_network/foundation/html_shim.dart'
    if (dart.library.html) 'dart:html' show window;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({Key? key}) : super(key: key);

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

        // ignore: avoid_print
        print(credential);

        final signInWithAppleEndpoint = Uri(
          scheme: 'https',
          host: 'thebonsai.network',
          path: '/sign_in_with_apple',
          queryParameters: <String, String>{
            'code': credential.authorizationCode,
            if (credential.givenName != null)
              'firstName': credential.givenName!,
            if (credential.familyName != null)
              'lastName': credential.familyName!,
            'useBundleId': !kIsWeb && (Platform.isIOS || Platform.isMacOS)
                ? 'true'
                : 'false',
            if (credential.state != null) 'state': credential.state!,
          },
        );

        final session = await http.Client().post(
          signInWithAppleEndpoint,
        );

        // If we got this far, a session based on the Apple ID credential has been created in your system,
        // and you can now set this as the app's session
        // ignore: avoid_print
        print(session);
      },
    );
  }
}
