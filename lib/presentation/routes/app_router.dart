import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:bonsai_network/presentation/pages/landing/landing_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LandingPage, initial: true),
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
