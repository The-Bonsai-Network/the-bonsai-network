import 'package:bonsai_network/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/application/login_menu_notifier.dart';
import 'package:bonsai_network/presentation/pages/login/components/login_page_app_bar.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth_container.dart';
import 'package:bonsai_network/presentation/pages/login/components/login_profile.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth/linkedin_oauth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<LoginMenuNotifier>(),
      child: _LoginPageWidget(),
    );
  }
}

class _LoginPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          const LoginPageAppBarWidget(),
          SliverSafeArea(
            top: false,
            sliver: SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Consumer<LoginMenuNotifier>(
                      builder: (context, model, _) => Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              'Let other entrepreneurs find out more about you.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const OAuthContainerWidget(),
                          const LoginProfilePage(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
