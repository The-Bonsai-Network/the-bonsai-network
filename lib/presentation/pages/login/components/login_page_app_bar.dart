import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoginPageAppBarWidget extends StatelessWidget {
  const LoginPageAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
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
            onTap: () => context.router.popUntilRoot(),
          ),
          backgroundColor: scrollOffset >= 0.0
              ? Colors.grey.withOpacity(scrollOffset.clamp(0.0, 1.0))
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
