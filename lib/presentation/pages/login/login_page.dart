import 'package:bonsai_network/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<LoginNotifier>(),
      child: _LoginPageWidget(),
    );
  }
}

class _LoginPageWidget extends StatelessWidget {
  final String backgroundSvg = "assets/images/olp_background.svg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            backgroundSvg,
            semanticsLabel: 'Optimi Background',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 100.0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.black87.withOpacity(0.5),
                    Colors.black87.withOpacity(0.3),
                    Colors.transparent,
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
