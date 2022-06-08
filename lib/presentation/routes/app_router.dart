import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:bonsai_network/presentation/pages/login/components/profile/login_profile.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/linkedin_oauth.dart';
import 'package:bonsai_network/presentation/pages/login/login_page.dart';
import 'package:bonsai_network/presentation/pages/landing/landing_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LandingPage, initial: true),
    AutoRoute(
      path: '/login',
      page: LoginPage,
      children: [
        AutoRoute(path: ':profile', page: LoginProfilePage),
        AutoRoute(path: ':linkedin', page: LinkedInPage),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
