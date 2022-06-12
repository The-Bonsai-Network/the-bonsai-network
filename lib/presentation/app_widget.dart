import 'package:bonsai_network/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/foundation/theme.dart';
import 'package:bonsai_network/presentation/routes/app_router.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _appRouter = AppRouter();

  @override
  void didChangeDependencies() {
    precacheImage(
      const AssetImage(
        'assets/images/bonsai.png',
      ),
      context,
    );
    precacheImage(
      const AssetImage(
        'assets/images/background/background1.jpg',
      ),
      context,
    );
    precacheImage(
      const AssetImage(
        'assets/images/background/background2.jpeg',
      ),
      context,
    );
    precacheImage(
      const AssetImage(
        'assets/images/background/background3.jpeg',
      ),
      context,
    );
    super.didChangeDependencies();
  }

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
