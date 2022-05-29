import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginNotifier extends ChangeNotifier {
  bool didAttemptLogin = false;
  bool isPasswordVisible = false;

  @factoryMethod
  final AuthFacade _authProvider;

  LoginNotifier(this._authProvider);

  final secureStorage = const FlutterSecureStorage();

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void login() async {
    didAttemptLogin = true;

    Future<Profile> response = _authProvider.signInWith(
      username: Username('OLPGuard'),
      password: Password('1234asdf'),
    );

    _unwrapResponse(response);

    notifyListeners();
  }

  void _unwrapResponse(
    Future<Profile> response,
  ) {
    response.then(
      (r) => r.fold(
        (_) => null,
        (profile) {
          secureStorage.write(
            key: 'olp-token',
            value: profile.data.token ?? '',
          );
        },
      ),
    );
  }
}
