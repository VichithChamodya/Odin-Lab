import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SectionTitle({super.key, required this.title, required this.onTap});

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
        SizedBox(
          height: 30,
          child: TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              foregroundColor: kOrangeColor,
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "see all",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kOrangeColor,
                  ),
                ),
                Icon(
                  Icons.navigate_next,
                  size: 20,
                  color: kGreyColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
