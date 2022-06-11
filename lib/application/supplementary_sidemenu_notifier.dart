import 'package:bonsai_network/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:bonsai_network/presentation/routes/app_router.dart';

@injectable
class SupplementarySidemenuNotifier extends ChangeNotifier {
  bool _loading = false;
  bool _logoutUser = false;
  String _currentRoute = CofoundersRoute.name;
  int _currentIndex = 0;

  bool get loading => _loading;
  bool get logoutUser => _logoutUser;
  String get currentRoute => _currentRoute;
  int get currentIndex => _currentIndex;

  final auth = getIt<FirebaseAuth>();

  SupplementarySidemenuNotifier() {
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        logoutUser = true;
      }
    });
  }

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  set logoutUser(bool logout) {
    _logoutUser = logout;
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
