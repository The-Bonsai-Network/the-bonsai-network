import 'package:bonsai_network/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/application/login_menu_notifier.dart';
import 'package:bonsai_network/foundation/theme.dart';

class OAuthContainerWidget extends StatelessWidget {
  const OAuthContainerWidget({Key? key}) : super(key: key);

  Widget _buildSplashOAuthButton(String svg) {
    return Consumer<LoginMenuNotifier>(
      builder: (context, model, _) => InkWell(
        highlightColor: ThemeColor.green5.color.withOpacity(0.2),
        splashColor: ThemeColor.green4.color,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            svg,
            semanticsLabel: 'Google OAuth',
            fit: BoxFit.contain,
            width: 50.0,
          ),
        ),
        onTap: () => model.currentRoute = LinkedInRoute.name,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSplashOAuthButton('assets/images/oauth/google.svg'),
          _buildSplashOAuthButton('assets/images/oauth/facebook.svg'),
          _buildSplashOAuthButton('assets/images/oauth/linkedin.svg'),
        ],
      ),
    );
  }
}
