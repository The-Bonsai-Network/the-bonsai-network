import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:linkedin_login/linkedin_login.dart';

class LinkedInPage extends StatefulWidget {
  const LinkedInPage({Key? key}) : super(key: key);

  @override
  State createState() => _LinkedInPageState();
}

class _LinkedInPageState extends State<LinkedInPage> {
  UserObject? user;
  bool logoutUser = false;

  @override
  Widget build(final BuildContext context) {
    return LinkedInUserWidget(
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
      onError: (final UserFailedAction e) {
        print('Error: ${e.toString()}');
        print('Error: ${e.stackTrace.toString()}');
      },
      onGetUserProfile: (final UserSucceededAction linkedInUser) {
        print(
          'Access token ${linkedInUser.user.token.accessToken}',
        );

        print('User id: ${linkedInUser.user.userId}');

        user = UserObject(
          firstName: linkedInUser.user.firstName?.localized?.label ?? '',
          lastName: linkedInUser.user.lastName?.localized?.label ?? '',
          email:
              linkedInUser.user.email?.elements?[0].handleDeep?.emailAddress ??
                  '',
          profileImageUrl: linkedInUser.user.profilePicture?.displayImageContent
                  ?.elements?[0].identifiers?[0].identifier ??
              '',
        );

        setState(() {
          logoutUser = false;
        });
      },
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        LinkedInButtonStandardWidget(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (final BuildContext context) => LinkedInAuthCodeWidget(
                  destroySession: logoutUser,
                  redirectUrl: dotenv.env['LINKEDIN_REDIRECT_URI'],
                  clientId: dotenv.env['LINKEDIN_CLIENT_ID'],
                  onError: (final AuthorizationFailedAction e) {
                    print('Error: ${e.toString()}');
                    print('Error: ${e.stackTrace.toString()}');
                  },
                  onGetAuthCode: (final AuthorizationSucceededAction response) {
                    print('Auth code ${response.codeResponse.code}');

                    print('State: ${response.codeResponse.state}');

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
        ),
        LinkedInButtonStandardWidget(
          onTap: () {
            setState(() {
              authorizationCode = null;
              logoutUser = true;
            });
          },
          buttonText: 'Logout user',
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Auth code: ${authorizationCode?.code} '),
              Text('State: ${authorizationCode?.state} '),
            ],
          ),
        ),
      ],
    );
  }
}

class AuthCodeObject {
  AuthCodeObject({required this.code, required this.state});

  final String code;
  final String state;
}

class UserObject {
  UserObject({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profileImageUrl,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String profileImageUrl;
}
