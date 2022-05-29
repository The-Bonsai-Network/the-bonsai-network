import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/foundation/theme.dart';
import 'package:bonsai_network/presentation/routes/app_router.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((TargetPlatform.macOS == defaultTargetPlatform) && !kIsWeb) {
      return ChangeNotifierProvider(
        create: (_) => AppThemeData(),
        builder: (context, _) {
          final themeMode = context.watch<AppThemeData>();
          return MaterialApp.router(
            title: 'The Bonsai Network',
            themeMode: themeMode.mode,
            theme: appTheme,
            darkTheme: appThemeDark,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        },
      );
    } else {
      return ChangeNotifierProvider(
        create: (_) => AppThemeData(),
        builder: (context, _) {
          final themeMode = context.watch<AppThemeData>();
          return MaterialApp.router(
            title: 'The Bonsai Network',
            themeMode: themeMode.mode,
            theme: appTheme,
            darkTheme: appThemeDark,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        },
      );
    }
  }
}
