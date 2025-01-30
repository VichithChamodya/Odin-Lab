import 'package:flutter/material.dart';
import 'package:odinlab/pages/authentication/signin_screen.dart';
import 'package:odinlab/pages/authentication/signup_screen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signinPage = true;

  // toggle pages
  void switchPages() {
    setState(() {
      signinPage = !signinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signinPage == true) {
      return SigninScreen(toggle: switchPages);
    } else {
      return SignupScreen(toggle: switchPages);
    }
  }
}
