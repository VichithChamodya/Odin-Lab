import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kSubMainColor,
            kDarkGreyColor,
            kDarkGreyColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 200,
              fit: BoxFit.cover,
            ),
            // add gradient colors to the text
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  kWhiteColor,
                  kSubMainColor,
                  kMainColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds),
              child: const Text(
                "Odin Lab",
                style: TextStyle(
                  fontFamily: "Orbitron",
                  fontSize: 70,
                  fontWeight: FontWeight.w900,
                  color: kWhiteColor, // set a base color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
