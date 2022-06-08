import 'package:flutter/material.dart';

class ProfileFormButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const ProfileFormButtonWidget({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  Widget _submitFormButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
            }
          },
          child: const Text('Join our network'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _submitFormButton(context);
}
