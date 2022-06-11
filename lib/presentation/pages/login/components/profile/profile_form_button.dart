import 'package:bonsai_network/application/supplementary_sidemenu_notifier.dart';
import 'package:bonsai_network/application/user_provider_notifier.dart';
import 'package:bonsai_network/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as p;

class ProfileFormButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> authFormKey;

  const ProfileFormButtonWidget({
    Key? key,
    required this.authFormKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return p.ChangeNotifierProvider(
      create: (context) => getIt<SupplementarySidemenuNotifier>(),
      child: _ProfileFormButtonWidget(
        authFormKey: authFormKey,
      ),
    );
  }
}

class _ProfileFormButtonWidget extends ConsumerStatefulWidget {
  final GlobalKey<FormState> authFormKey;

  const _ProfileFormButtonWidget({
    Key? key,
    required this.authFormKey,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProfileFormButtonState();
}

class _ProfileFormButtonState extends ConsumerState<_ProfileFormButtonWidget> {
  Widget _submitFormButton(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (widget.authFormKey.currentState?.validate() ?? false) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Welcome to the Bonsai Network!')),
              );

              ref.read(userProfileProvider.notifier).signInUser();
            }
          },
          child: const Text('Join our network'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _submitFormButton(context, ref);
}
