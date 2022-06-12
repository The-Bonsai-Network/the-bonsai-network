import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:bonsai_network/presentation/pages/dashboard/dashboard_page.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/login_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as p;

import 'package:bonsai_network/presentation/routes/app_router.dart';
import 'package:bonsai_network/application/login_menu_notifier.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/login_email.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/login_forgot_password.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/login_register_form.dart';

class LoginBackgroundImageWidget extends StatefulWidget {
  const LoginBackgroundImageWidget({Key? key}) : super(key: key);

  @override
  State<LoginBackgroundImageWidget> createState() =>
      _LoginBackgroundImageWidgetState();
}

class _LoginBackgroundImageWidgetState
    extends State<LoginBackgroundImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.transparent],
            ).createShader(
              Rect.fromLTRB(0, 0, rect.width, rect.height),
            );
          },
          blendMode: BlendMode.dstIn,
          child: Container(
            height: 400,
            width: 2000,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/background/background1.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 50.0,
            bottom: 50.0,
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 250,
                    maxWidth: 500,
                  ),
                  child: p.Consumer<LoginMenuNotifier>(
                    builder: (context, model, _) => AutoRouter(
                      placeholder: (_) => const LoginBackgroundImageWidget(),
                      builder: (_, child) {
                        switch (model.currentRoute) {
                          case LoginEmailRoute.name:
                            return const LoginEmailPage();
                          case LoginForgotPasswordRoute.name:
                            return const LoginForgotPasswordPage();
                          case LoginProfileRoute.name:
                            return const LoginProfilePage();
                          default:
                            return const LoginRegisterFormPage();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
