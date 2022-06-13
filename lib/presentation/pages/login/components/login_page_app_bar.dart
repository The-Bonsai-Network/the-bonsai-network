import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:bonsai_network/presentation/routes/app_router.dart';

class LoginPageAppBarWidget extends StatelessWidget {
  const LoginPageAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        double scrollOffset = (constraints.scrollOffset / 200.0)
          ..abs()
          ..clamp(0.0, 1.0);

        double platformBrightness =
            MediaQuery.of(context).platformBrightness.index.toDouble()
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
            onTap: () =>
                AutoRouter.of(context).replaceAll([const LandingRoute()]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.chevron_left,
                  color: Theme.of(context).textTheme.bodyMedium?.color ??
                      Colors.black87,
                ),
                Text(
                  'Back',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color ??
                        Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: scrollOffset >= 0.0
              ? platformBrightness == 0
                  ? Colors.black.withOpacity(scrollOffset.clamp(0.0, 1.0))
                  : Colors.white.withOpacity(scrollOffset.clamp(0.0, 1.0))
              : Colors.transparent,
          flexibleSpace: OrientationBuilder(
            builder: (context, orientation) {
              return FlexibleSpaceBar(
                background: Container(color: Colors.transparent),
                centerTitle: scrollOffset >= 0.2,
                titlePadding: EdgeInsets.symmetric(
                  horizontal: orientation == Orientation.portrait ? 12.0 : 12.0,
                  vertical: 12.0,
                ),
                title: Text(
                  'Personal Information',
                  style: Theme.of(context).textTheme.titleLarge,
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
    );
  }
}
