import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:bonsai_network/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);

  getIt.registerLazySingleton<FirebaseApp>(
    () => Firebase.app(),
  );

  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instanceFor(app: getIt<FirebaseApp>()),
  );

  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instanceFor(app: getIt<FirebaseApp>()),
  );
}
