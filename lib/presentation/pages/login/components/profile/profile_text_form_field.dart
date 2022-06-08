import 'package:flutter/material.dart';

class ProfileTextFormFieldWidget extends StatelessWidget {
  final String placeholder;
  final String validatorText;
  final BorderRadius borderRadius;

  const ProfileTextFormFieldWidget({
    Key? key,
    required this.placeholder,
    required this.validatorText,
    required this.borderRadius,
  }) : super(key: key);

  Widget _buildTextFormField(
    String placeholder,
    String validatorText,
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

  @override
  Widget build(BuildContext context) => _buildTextFormField(
        placeholder,
        validatorText,
        borderRadius,
      );
}
