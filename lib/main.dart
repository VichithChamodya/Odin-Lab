import 'package:flutter/material.dart';
import 'package:odinlab/pages/onboarding_screen/front_screen.dart';

void main() {
  runApp(const OdinLab());
}

class OdinLab extends StatelessWidget {
  const OdinLab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Odin Lab",
      theme: ThemeData(
        fontFamily: "Inter",
      ),
      home: const Scaffold(
        body: FrontScreen(),
      ),
    );
  }
}
