import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardNotifier extends ChangeNotifier {
  final secureStorage = const FlutterSecureStorage();
}
