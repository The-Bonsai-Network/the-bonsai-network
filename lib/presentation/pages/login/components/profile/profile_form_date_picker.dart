import 'package:bonsai_network/application/user_provider_notifier.dart';
import 'package:bonsai_network/foundation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileFormDatePickerWidget extends ConsumerWidget {
  const ProfileFormDatePickerWidget({Key? key}) : super(key: key);

  void showDatePickerBottomSheet(BuildContext context, WidgetRef ref) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 54750)),
      lastDate: DateTime.now(),
    );

    ref.read(userProfileProvider.notifier).updateDateOfBirth(selectedDate);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          onPressed: () => showDatePickerBottomSheet(context, ref),
          child: const Text('Select'),
        ),
      ],
    );
  }
}
