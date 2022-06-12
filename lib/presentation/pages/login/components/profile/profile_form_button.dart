import 'package:auto_route/auto_route.dart';
import 'package:bonsai_network/application/login_menu_notifier.dart';
import 'package:bonsai_network/application/supplementary_sidemenu_notifier.dart';
import 'package:bonsai_network/foundation/theme.dart';
import 'package:bonsai_network/injection.dart';
import 'package:bonsai_network/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as p;

class ProfileFormButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> authFormKey;
  final String title;
  final String route;

  const ProfileFormButtonWidget({
    Key? key,
    required this.authFormKey,
    required this.title,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return p.ChangeNotifierProvider(
      create: (context) => getIt<SupplementarySidemenuNotifier>(),
      child: _ProfileFormButtonWidget(
        authFormKey: authFormKey,
        title: title,
        route: route,
      ),
    );
  }
}

class _ProfileFormButtonWidget extends ConsumerStatefulWidget {
  final GlobalKey<FormState> authFormKey;
  final String title;
  final String route;

  const _ProfileFormButtonWidget({
    Key? key,
    required this.authFormKey,
    required this.title,
    required this.route,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProfileFormButtonState();
}

class _ProfileFormButtonState extends ConsumerState<_ProfileFormButtonWidget> {
  Widget _submitFormButton(BuildContext context, WidgetRef ref) {
    return p.Consumer<LoginMenuNotifier>(
      builder: (context, model, _) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                final validated =
                    widget.authFormKey.currentState?.validate() ?? false;

                if (widget.route == DashboardRoute.name) {
                  if (!validated) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: ThemeColor.primaryGreen.color,
                        content: const Text(
                          'You have some missing required fields!',
                        ),
                      ),
                    );

                    return;
                  }

                  AutoRouter.of(context).replaceAll([const DashboardRoute()]);
                } else if (widget.title.compareTo('Forgot Password') == 0 &&
                    widget.route == LoginRegisterFormRoute.name) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: ThemeColor.primaryGreen.color,
                      content: const Text(
                        'If you have an account you\'ve got mail',
                      ),
                    ),
                  );

                  model.currentRoute = widget.route;
                } else {
                  model.currentRoute = widget.route;
                }
              });
            },
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _submitFormButton(context, ref);
}
