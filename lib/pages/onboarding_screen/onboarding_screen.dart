import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/constant/sizes.dart';
import 'package:odinlab/data/onboarding_data.dart';
import 'package:odinlab/pages/login_screen/signup_screen.dart';
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

  // create page controller
  final PageController _controller = PageController();

  // track the current page index
  int _currentIndex = 0;

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
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: data.onboarding.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // if it's the first page, return the front screen
                    return const FrontScreen();
                  } else {
                    // otherwise, return the onboarding screens
                    return SharedOnboardingScreen(
                      // adjust index to skip front screen
                      image: data.onboarding[index - 1].image,
                      title: data.onboarding[index - 1].title,
                      subtitle: data.onboarding[index - 1].subtitle,
                    );
                  }
                },
              ),

              // page dot indicator
              Container(
                alignment: const Alignment(0, 0.65),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 5,
                  effect: const SwapEffect(
                    type: SwapType.yRotation,
                    activeDotColor: kSubMainColor,
                    dotColor: kShadowColor,
                  ),
                ),
              ),

              // navigation button
              Positioned(
                left: 0,
                right: 0,
                bottom: 55,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kMaxPadding),
                  child: CustomButton(
                      buttonText: _currentIndex == 0 ? "Let's Start !" : "Next",
                      buttonTextColor:
                          _currentIndex == 0 ? kSubMainColor : kWhiteColor,
                      buttonColor1:
                          _currentIndex == 0 ? kWhiteColor : kMainColor,
                      buttonColor2:
                          _currentIndex == 0 ? kWhiteColor : kSubMainColor,
                      onPressed: () {
                        _currentIndex == 4
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              )
                            : _controller.animateToPage(
                                _controller.page!.toInt() + 1,
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.easeInOutQuint,
                              );
                      }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
