import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/constant/sizes.dart';
import 'package:odinlab/data/onboarding_data.dart';
import 'package:odinlab/pages/onboarding_screen/front_screen.dart';
import 'package:odinlab/pages/onboarding_screen/shared_onboarding_screen.dart';
import 'package:odinlab/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // get onboarding data
  final data = OnboardingData();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      kMainColor,
                      kWhiteColor,
                      kWhiteColor,
                      kWhiteColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              PageView.builder(
                itemCount: data.onboarding.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // If it's the first page, return the FrontScreen
                    return const FrontScreen();
                  } else {
                    // Otherwise, return the onboarding screens
                    return SharedOnboardingScreen(
                      // Adjust index to skip FrontScreen
                      image: data.onboarding[index - 1].image,
                      title: data.onboarding[index - 1].title,
                      subtitle: data.onboarding[index - 1].subtitle,
                    );
                  }
                },
              ),

              // navigation button
              const Positioned(
                left: 0,
                right: 0,
                bottom: 55,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kMaxPadding),
                  child: CustomButton(
                    buttonText: "Start",
                    buttonColor1: kSubMainColor,
                    buttonColor2: kMainColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
