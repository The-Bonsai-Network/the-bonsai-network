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
              double scrollOffset = (constraints.scrollOffset / 200.0)
                ..abs()
                ..clamp(0.0, 1.0);

              return SliverAppBar(
                expandedHeight: 120.0,
                stretch: true,
                pinned: true,
                floating: true,
                elevation: 0.0,
                leadingWidth: 200,
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
                backgroundColor: scrollOffset >= 0.0
                    ? Colors.white.withOpacity(scrollOffset)
                    : Colors.transparent,
                flexibleSpace: OrientationBuilder(
                  builder: (context, orientation) {
                    return FlexibleSpaceBar(
                      background: Container(color: Colors.transparent),
                      centerTitle: scrollOffset >= 0.2,
                      titlePadding: EdgeInsets.symmetric(
                        horizontal:
                            orientation == Orientation.portrait ? 12.0 : 48.0,
                        vertical: 12.0,
                      ),
                      title: const Text(
                        'Personal Information',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      stretchModes: const [
                        StretchMode.blurBackground,
                        StretchMode.fadeTitle,
                      ],
                    );
                  },
                ),
              );
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            sliver: SliverFillRemaining(
              hasScrollBody: true,
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
