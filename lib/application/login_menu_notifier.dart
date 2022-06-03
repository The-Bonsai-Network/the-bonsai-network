import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:bonsai_network/presentation/routes/app_router.dart';

@injectable
class LoginMenuNotifier extends ChangeNotifier {
  bool _visible = true;
  String _currentRoute = LoginProfileRoute.name;
  int _currentIndex = 0;

  bool get visible => _visible;
  String get currentRoute => _currentRoute;
  int get currentIndex => _currentIndex;

  set visible(bool visible) {
    _visible = visible;
    notifyListeners();
  }

  set currentRoute(String currentRoute) {
    _currentRoute = currentRoute;
    notifyListeners();
  }

  set currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }
}
