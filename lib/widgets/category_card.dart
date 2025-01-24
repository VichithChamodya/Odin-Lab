import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class CategoryCard extends StatelessWidget {
  final IconData categoryIcon;
  final String categoryName;
  const CategoryCard(
      {super.key, required this.categoryIcon, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          backgroundColor: kWhiteColor,
          foregroundColor: kSubMainColor,
          shadowColor: kShadowColor,
          elevation: 4,
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              categoryIcon,
              color: kSubMainColor,
            ),
            const SizedBox(width: 5),
            Text(
              categoryName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
