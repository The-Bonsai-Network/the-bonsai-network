import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:bonsai_network/foundation/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primaryBackground.color,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverLayoutBuilder(
            builder: (BuildContext context, constraints) {
              final scrollOffset = constraints.scrollOffset / 200.0;
              final isNotScrolled = constraints.scrollOffset < 20;

              return SliverAppBar(
                expandedHeight: 100.0,
                stretch: true,
                pinned: true,
                leading: InkWell(
                  child: Row(
                    children: const [
                      Icon(
                        Icons.chevron_left,
                        color: Colors.black87,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => context.router.popUntilRoot(),
                ),
                backgroundColor: Colors.white.withOpacity(scrollOffset),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(color: Colors.transparent),
                  centerTitle: !isNotScrolled,
                  titlePadding: const EdgeInsets.all(12.0),
                  title: const Text(
                    'Personal Information',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  stretchModes: const [
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                ),
              );
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
