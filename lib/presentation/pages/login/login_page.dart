import 'package:bonsai_network/foundation/theme.dart';
import 'package:flutter/material.dart';

import 'package:bonsai_network/presentation/pages/login/components/login_page_app_bar.dart';
import 'package:bonsai_network/presentation/pages/login/components/oauth_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          const LoginPageAppBarWidget(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            sliver: SliverFillRemaining(
              hasScrollBody: true,
              fillOverscroll: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let other entrepreneurs find out more about you.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const OAuthContainerWidget(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
