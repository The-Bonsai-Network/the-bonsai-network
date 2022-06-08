import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/injection.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/linkedin_oauth.dart';
import 'package:bonsai_network/presentation/routes/app_router.dart';
import 'package:bonsai_network/application/login_menu_notifier.dart';
import 'package:bonsai_network/foundation/theme.dart';

class OAuthContainerWidget extends StatefulWidget {
  const OAuthContainerWidget({Key? key}) : super(key: key);

  @override
  State<OAuthContainerWidget> createState() => _OAuthContainerWidgetState();
}

class _OAuthContainerWidgetState extends State<OAuthContainerWidget> {
  Future<void> _buildLinkedInModal() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (context) => getIt<LoginMenuNotifier>(),
          child: const Expanded(
            child: LinkedInPage(),
          ),
        );
      },
    );
  }

  Widget _buildSplashOAuthButton(String svg, String? routeName) {
    return Consumer<LoginMenuNotifier>(
      builder: (context, model, _) => AutoRouter(
        placeholder: (_) => Container(),
        builder: (_, child) {
          return InkWell(
            highlightColor: ThemeColor.green5.color.withOpacity(0.2),
            splashColor: ThemeColor.green4.color,
            borderRadius: BorderRadius.circular(12.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                svg,
                fit: BoxFit.contain,
                width: 50.0,
              ),
            ),
            onTap: () {
              switch (routeName) {
                case LinkedInRoute.name:
                  _buildLinkedInModal();
                  break;

                default:
                  break;
              }
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSplashOAuthButton(
              'assets/images/oauth/google.svg', LinkedInRoute.name),
          _buildSplashOAuthButton(
              'assets/images/oauth/facebook.svg', LinkedInRoute.name),
          _buildSplashOAuthButton(
              'assets/images/oauth/linkedin.svg', LinkedInRoute.name),
        ],
      ),
    );
  }
}
