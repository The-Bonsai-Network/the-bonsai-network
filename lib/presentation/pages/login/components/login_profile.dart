import 'package:bonsai_network/foundation/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/application/login_menu_notifier.dart';

class LoginProfilePage extends StatefulWidget {
  const LoginProfilePage({Key? key}) : super(key: key);

  @override
  State<LoginProfilePage> createState() => _LoginProfilePageState();
}

class _LoginProfilePageState extends State<LoginProfilePage> {
  final _formKey = GlobalKey<FormState>();

  Widget _buildTextFormField(
    String? placeholder,
    String? validatorText,
    BorderRadius borderRadius,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      margin: EdgeInsets.zero,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            labelText: placeholder,
            labelStyle: const TextStyle(
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorText;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _submitFormButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
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
  Widget build(BuildContext context) {
    return Consumer<LoginMenuNotifier>(
      builder: (context, model, _) => Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildTextFormField(
                'First Name',
                'Fist Name is required',
                const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                indent: 8.0,
                endIndent: 8.00,
                color: ThemeColor.primaryGreen.color.withOpacity(0.4),
              ),
              _buildTextFormField(
                'Surname',
                'Surname is required',
                const BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 6.0)),
              _buildTextFormField(
                'Email',
                'Email is required',
                const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                indent: 8.0,
                endIndent: 8.00,
                color: ThemeColor.primaryGreen.color.withOpacity(0.4),
              ),
              _buildTextFormField(
                'Confirm Email',
                'Confirm Email is required',
                const BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              _submitFormButton(),
            ],
          ),
        ),
      ),
    );
  }
}
