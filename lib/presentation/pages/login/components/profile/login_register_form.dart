import 'package:bonsai_network/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/foundation/theme.dart';
import 'package:bonsai_network/application/login_menu_notifier.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/profile_form_button.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/profile_text_form_field.dart';

class LoginRegisterFormPage extends StatefulWidget {
  const LoginRegisterFormPage({Key? key}) : super(key: key);

  @override
  State<LoginRegisterFormPage> createState() => _LoginRegisterFormPageState();
}

class _LoginRegisterFormPageState extends State<LoginRegisterFormPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final tween = Tween<Offset>(
    begin: const Offset(1.0, 0.0),
    end: Offset.zero,
  );

  late AnimationController controller;

  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCubic,
    );

    return Consumer<LoginMenuNotifier>(
      builder: (context, model, _) => Form(
        key: _formKey,
        child: SlideTransition(
          position: tween.animate(curve),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileTextFormFieldWidget(
                  placeholder: 'Email',
                  validatorText: 'Email is required',
                  borderRadius: BorderRadius.circular(8.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 8.0,
                    endIndent: 8.00,
                    color: ThemeColor.primaryGreen.color.withOpacity(0.4),
                  ),
                ),
                ProfileFormButtonWidget(
                  authFormKey: _formKey,
                  title: 'Continue',
                  route: LoginEmailRoute.name,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 8.0,
                    endIndent: 8.00,
                    color: ThemeColor.primaryGreen.color.withOpacity(0.4),
                  ),
                ),
                Row(
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          model.currentRoute = LoginProfileRoute.name;
                        });
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? ThemeColor.primaryGreen.color
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      model.currentRoute = LoginForgotPasswordRoute.name;
                    });
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? ThemeColor.primaryGreen.color
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
