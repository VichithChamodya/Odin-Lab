import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/constant/sizes.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const SharedOnboardingScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMaxPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: kDefaultSizedBox),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: kBlackColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kSmallSizedBox),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: kGreyColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kMaxSizedBox),
        ],
      ),
    );
  }
}
