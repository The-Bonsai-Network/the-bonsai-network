import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OAuthFailureDialog extends StatelessWidget {
  final String svgName;

  const OAuthFailureDialog({
    Key? key,
    required this.svgName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SvgPicture.asset(
              svgName,
              fit: BoxFit.contain,
              width: 50.0,
            ),
          ),
        ),
        const Text('Failed to authenticate user with OAuth.')
      ],
    );
  }
}
