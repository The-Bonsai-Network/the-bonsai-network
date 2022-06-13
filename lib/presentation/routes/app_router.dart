import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:bonsai_network/presentation/pages/login/components/profile/login_profile.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/linkedin_oauth.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/login_email.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/login_forgot_password.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/google_oauth.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/facebook_oauth.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/login_register_form.dart';
import 'package:bonsai_network/presentation/pages/login/login_page.dart';
import 'package:bonsai_network/presentation/pages/landing/landing_page.dart';
import 'package:bonsai_network/presentation/pages/dashboard/dashboard_page.dart';
import 'package:bonsai_network/presentation/pages/cofounders/cofounders_page.dart';

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
        AutoRoute(path: ':google', page: GooglePage),
        AutoRoute(path: ':facebook', page: FacebookPage),
        AutoRoute(path: ':register', page: LoginRegisterFormPage),
        AutoRoute(path: ':forgot-password', page: LoginForgotPasswordPage),
        AutoRoute(path: ':email', page: LoginEmailPage),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      path: '/dashboard',
      page: DashboardPage,
      children: [
        AutoRoute(path: ':cofounders', page: CofoundersPage),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
