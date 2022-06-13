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
    BuildContext context,
    String placeholder,
    String validatorText,
    BorderRadius borderRadius,
  ) {
    return Card(
      color: MediaQuery.of(context).platformBrightness == Brightness.light
          ? Colors.white
          : Colors.black,
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
            labelStyle: TextStyle(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Colors.grey
                      : Colors.white,
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
        context,
        placeholder,
        validatorText,
        borderRadius,
      );
}
