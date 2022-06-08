import 'package:flutter/material.dart';

class ProfileFormHeaderWidget extends StatelessWidget {
  final String header;

  const ProfileFormHeaderWidget({
    Key? key,
    required this.header,
  }) : super(key: key);

  Widget _buildFormHeader(String? header) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 12.0,
              ),
              child: Text(
                header ?? '',
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildFormHeader(header);
}
