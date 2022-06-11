// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LandingPage());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DashboardPage());
    },
    LoginProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginProfilePage());
    },
    LinkedInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LinkedInPage());
    },
    CofoundersRoute.name: (routeData) {
      final args = routeData.argsAs<CofoundersRouteArgs>(
          orElse: () => const CofoundersRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: CofoundersPage(key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(LandingRoute.name, path: '/'),
        RouteConfig(LoginRoute.name, path: '/login', children: [
          RouteConfig(LoginProfileRoute.name,
              path: ':profile', parent: LoginRoute.name),
          RouteConfig(LinkedInRoute.name,
              path: ':linkedin', parent: LoginRoute.name),
          RouteConfig('*#redirect',
              path: '*',
              parent: LoginRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        RouteConfig(DashboardRoute.name, path: '/dashboard', children: [
          RouteConfig(CofoundersRoute.name,
              path: ':cofounders', parent: DashboardRoute.name),
          RouteConfig('*#redirect',
              path: '*',
              parent: DashboardRoute.name,
              redirectTo: '',
              fullMatch: true)
        ])
      ];
}

/// generated route for
/// [LandingPage]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(LoginRoute.name, path: '/login', initialChildren: children);

  static const String name = 'LoginRoute';
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(DashboardRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [LoginProfilePage]
class LoginProfileRoute extends PageRouteInfo<void> {
  const LoginProfileRoute() : super(LoginProfileRoute.name, path: ':profile');

  static const String name = 'LoginProfileRoute';
}

/// generated route for
/// [LinkedInPage]
class LinkedInRoute extends PageRouteInfo<void> {
  const LinkedInRoute() : super(LinkedInRoute.name, path: ':linkedin');

  static const String name = 'LinkedInRoute';
}

/// generated route for
/// [CofoundersPage]
class CofoundersRoute extends PageRouteInfo<CofoundersRouteArgs> {
  CofoundersRoute({Key? key})
      : super(CofoundersRoute.name,
            path: ':cofounders', args: CofoundersRouteArgs(key: key));

  static const String name = 'CofoundersRoute';
}

class CofoundersRouteArgs {
  const CofoundersRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CofoundersRouteArgs{key: $key}';
  }
}
