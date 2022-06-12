import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/google_oauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/injection.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/apple_oauth.dart';
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
  Widget _buildLinkedInnerSheet(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const LinkedInPage(),
            ),
          ),
        );
      },
    );
  }

  Future<void> _buildLinkedInModal() {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (context) => getIt<LoginMenuNotifier>(),
          child: _buildLinkedInnerSheet(context),
        );
      },
    );
  }

  Future<void> _buildOAuthModal(Widget page) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (context) => getIt<LoginMenuNotifier>(),
          child: page,
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
              padding: const EdgeInsets.all(2.0),
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

                case GoogleRoute.name:
                  _buildOAuthModal(const GooglePage());
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSplashOAuthButton(
                  'assets/images/oauth/google.svg', GoogleRoute.name),
              _buildSplashOAuthButton(
                  'assets/images/oauth/facebook.svg', LinkedInRoute.name),
              _buildSplashOAuthButton(
                  'assets/images/oauth/linkedin.svg', LinkedInRoute.name),
            ],
          ),
          if (Platform.isIOS) ...[
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: SizedBox(
                height: 50.0,
                child: AppleSignInButton(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
