import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:bonsai_network/foundation/theme.dart';
import 'package:bonsai_network/presentation/routes/app_router.dart';

class LandingButtonWidget extends StatefulWidget {
  const LandingButtonWidget({Key? key}) : super(key: key);

  @override
  State<LandingButtonWidget> createState() => _LandingButtonWidgetState();
}

class _LandingButtonWidgetState extends State<LandingButtonWidget> {
  final _duration = const Duration(milliseconds: 200);

  late Color _color;
  late Size _size;

  @override
  initState() {
    super.initState();

    _color = ThemeColor.primaryGreen.color;
    _size = const Size(250, 50);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      width: _size.width,
      height: _size.height,
      child: ElevatedButton(
        style: elevatedButtonStyleWith(
          color: _color,
          radius: const Radius.circular(22.5),
        ),
        onPressed: () => AutoRouter.of(context).push(const LoginRoute()),
        child: const Text(
          'Let\'s Go',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
