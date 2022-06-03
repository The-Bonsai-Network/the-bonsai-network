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
    LoginProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginProfilePage());
    },
    LinkedInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LinkedInPage());
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
