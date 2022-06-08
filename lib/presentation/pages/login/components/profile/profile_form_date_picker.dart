import 'package:bonsai_network/foundation/theme.dart';
import 'package:flutter/material.dart';

class ProfileFormDatePickerWidget extends StatelessWidget {
  const ProfileFormDatePickerWidget({Key? key}) : super(key: key);

  void showDatePickerBottomSheet(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 54750)),
      lastDate: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Date of Birth'),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
            backgroundColor: MaterialStateProperty.all(
              ThemeColor.primaryGreen.color,
            ),
            overlayColor: MaterialStateProperty.all(
              ThemeColor.green3.color,
            ),
          ),
          onPressed: () => showDatePickerBottomSheet(context),
          child: const Text('Select'),
        ),
      ],
    );
  }
}
