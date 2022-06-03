import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/application/login_menu_notifier.dart';

class LoginProfilePage extends StatefulWidget {
  const LoginProfilePage({Key? key}) : super(key: key);

  @override
  State<LoginProfilePage> createState() => _LoginProfilePageState();
}

class _LoginProfilePageState extends State<LoginProfilePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginMenuNotifier>(
      builder: (context, model, _) => BottomSheet(
        animationController: _controller,
        elevation: 5.0,
        enableDrag: true,
        onClosing: () => _controller?.reverse(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        builder: (BuildContext context) {
          return Container();
        },
      ),
    );
  }
}
