import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/services/auth.dart';
import 'package:odinlab/widgets/animated_positioned_image.dart';
import 'package:odinlab/widgets/custom_button.dart';
import 'package:odinlab/widgets/custom_password_field.dart';
import 'package:odinlab/widgets/custom_text_field.dart';

class SigninScreen extends StatefulWidget {
  final Function toggle;
  const SigninScreen({super.key, required this.toggle});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  String _errorMessage = "";

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(),
            _buildFormSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          const AnimatedPositionedImage(
            left: 30,
            width: 80,
            height: 180,
            asset: 'assets/images/light-1.png',
            duration: 4000,
          ),
          const AnimatedPositionedImage(
            left: 140,
            width: 80,
            height: 130,
            asset: 'assets/images/light-2.png',
            duration: 1000,
          ),
          const AnimatedPositionedImage(
            right: 10,
            top: 10,
            width: 80,
            height: 150,
            asset: 'assets/images/logo.png',
            duration: 0,
          ),
          Positioned(
            left: 30,
            top: 220,
            child: FadeInUp(
              duration: const Duration(milliseconds: 300),
              child: const Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputFields(),
            _buildErrorSection(),
            _buildSignInButton(),
            _buildSocialLoginSection(),
            _buildSignUpRedirect(),
          ],
        ),
      ),
    );
  }

  // input fields
  Widget _buildInputFields() {
    return Column(
      children: [
        FadeInUp(
          duration: const Duration(milliseconds: 400),
          child: CustomTextField(
            controller: _emailController,
            hintText: "Email",
            validator: (value) =>
                value!.isEmpty ? "Please Enter Your Email" : null,
          ),
        ),
        const SizedBox(height: 10),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          child: CustomPasswordField(
            controller: _passwordController,
            hintText: "Password",
            isVisible: _isPasswordVisible,
            toggleVisibility: () =>
                setState(() => _isPasswordVisible = !_isPasswordVisible),
            validator: (value) =>
                value!.isEmpty ? "Please Enter Valid Password" : null,
          ),
        ),
      ],
    );
  }

  // error messages
  Widget _buildErrorSection() {
    return Column(
      children: [
        const SizedBox(height: 20),
        FadeInLeft(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            "❌ $_errorMessage",
            style: const TextStyle(color: kRedColor, fontSize: 14),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  // social Logins
  Widget _buildSocialLoginSection() {
    return Column(
      children: [
        _buildOrDivider(),
        const SizedBox(height: 20),
        _buildSocialButtons(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildOrDivider() {
    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      child: const Row(
        children: [
          Expanded(child: Divider(thickness: 1, indent: 10, endIndent: 10)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text("or", style: TextStyle(color: kGreyColor)),
          ),
          Expanded(child: Divider(thickness: 1, indent: 10, endIndent: 10)),
        ],
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: _buildSocialButton("assets/icons/google.svg", () {}),
        ),
        const SizedBox(width: 20),
        FadeInLeft(
          duration: const Duration(milliseconds: 1200),
          child: _buildSocialButton(
              "assets/icons/anonymous.svg", _handleAnonymousLogin),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String asset, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(asset),
    );
  }

  // sign up redirect
  Widget _buildSignUpRedirect() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1000),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have an Account? ",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: kGreyColor),
          ),
          GestureDetector(
            onTap: () => widget.toggle(),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: kSubMainColor,
                decoration: TextDecoration.underline,
                decorationColor: kSubMainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // sign in button
  Widget _buildSignInButton() {
    return FadeInUp(
      duration: const Duration(milliseconds: 700),
      child: SizedBox(
        width: double.infinity,
        child: CustomButton(
          buttonText: "Sign In",
          buttonColor1: kMainColor,
          buttonColor2: kSubMainColor,
          buttonTextColor: kWhiteColor,
          onPressed: _handleSignIn,
        ),
      ),
    );
  }

  // sign in logic
  Future<void> _handleSignIn() async {
    if (!_formKey.currentState!.validate()) return;

    _showLoadingDialog(context);

    try {
      final result = await _auth.signinWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );

      if (!mounted) return;
      Navigator.of(context).pop();

      if (result == null) {
        setState(() => _errorMessage = "Invalid Email or Password");
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.of(context).pop();
      setState(() => _errorMessage = "An error occurred. Please try again.");
    }
  }

  // anonymous login
  Future<void> _handleAnonymousLogin() async {
    _showLoadingDialog(context);

    try {
      await _auth.signinAnonymously();
      if (!mounted) return;
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      Navigator.of(context).pop();
      setState(() => _errorMessage = "Anonymous login failed");
    }
  }

  // loading dialog
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: kSubMainColor),
      ),
    );
  }
}
