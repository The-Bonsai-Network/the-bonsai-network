import 'package:auto_route/auto_route.dart';
import 'package:bonsai_network/presentation/routes/app_router.dart';
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
    return Center(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.white
              : Colors.black,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 100.0,
            maxHeight: 200,
          ),
          child: Column(
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
              const Text(
                'Failed to authenticate user with OAuth.',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'It\'s most likely you\'ve already signed in with a different OAuth provider.',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => context.router.popUntilRouteWithName(
                    LoginRoute.name,
                  ),
                  child: const Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
