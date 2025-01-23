import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/widgets/side_menu.dart';
import 'package:odinlab/pages/main_screen.dart';

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
        primaryColor: kMainColor,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: kSubMainColor,
          selectionColor: kSelectionColor,
          selectionHandleColor: kSubMainColor,
        ),
      ),
      home: const Scaffold(
        body: Stack(
          children: [
            SideMenu(),
            MainScreen(),
          ],
        ),
      ),
    );
  }
}
