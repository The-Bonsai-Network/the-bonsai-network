import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:bonsai_network/presentation/routes/app_router.dart';

@injectable
class LoginMenuNotifier extends ChangeNotifier {
  String _currentRoute = LoginRegisterFormRoute.name;
  int _currentGenderIndex = 0;

  String get currentRoute => _currentRoute;
  int get currentGenderIndex => _currentGenderIndex;

  set currentRoute(String currentRoute) {
    _currentRoute = currentRoute;
    notifyListeners();
  }

  set currentGenderIndex(int currentIndex) {
    _currentGenderIndex = currentIndex;
    notifyListeners();
  }
}
