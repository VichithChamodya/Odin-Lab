import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: kGreyColor,
          ),
        ),
        const Spacer(),
        const Text(
          "see all",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kGreyColor,
          ),
        ),
        const Icon(
          Icons.navigate_next,
          size: 22,
          color: kGreyColor,
        ),
      ],
    );
  }
}
