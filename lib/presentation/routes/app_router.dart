import 'package:auto_route/auto_route.dart';
import 'package:bonsai_network/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    // AutoRoute(
    //   path: '/dashboard',
    //   page: DashboardPage,
    //   children: [
    //     AutoRoute(path: ':week', page: WeekPage),
    //     AutoRoute(path: ':calendar', page: CalendarPage),
    //     AutoRoute(path: ':lessons', page: LessonsPage),
    //     AutoRoute(path: ':library', page: LibraryPage),
    //     RedirectRoute(path: '*', redirectTo: ''),
    //   ],
    // ),
  ],
)
class AppRouter extends _$AppRouter {}
