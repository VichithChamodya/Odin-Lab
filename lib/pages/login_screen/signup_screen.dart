import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/constant/sizes.dart';
import 'package:odinlab/pages/login_screen/terms_and_conditions_screen.dart';
import 'package:odinlab/widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isRememberMe = true;
  bool _isTermsAccepted = true;

  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
          _buildAnimatedImage(
            30,
            80,
            200,
            'assets/images/light-1.png',
            1000,
          ),
          _buildAnimatedImage(
            140,
            80,
            150,
            'assets/images/light-2.png',
            1100,
          ),
          _buildAnimatedImage(
            null,
            80,
            150,
            'assets/images/logo.png',
            1200,
            right: 10,
            top: 10,
          ),
          Positioned(
            left: 30,
            top: 220,
            child: FadeInUp(
              duration: const Duration(milliseconds: 1300),
              child: const Text(
                "Create\nNew Account",
                textAlign: TextAlign.left,
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

  Widget _buildAnimatedImage(
      double? left, double width, double height, String asset, int duration,
      {double? right, double? top}) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      width: width,
      height: height,
      child: FadeInUp(
        duration: Duration(milliseconds: duration),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(asset),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInLeft(
              duration: const Duration(milliseconds: 1000),
              child: _buildTextField(
                controller: _userNameController,
                hintText: "Username",
                validator: (value) =>
                    value!.isEmpty ? "Please Enter Your Name" : null,
              ),
            ),
            const SizedBox(height: 10),
            FadeInLeft(
              duration: const Duration(milliseconds: 1100),
              child: _buildTextField(
                controller: _emailController,
                hintText: "Email",
                validator: (value) =>
                    value!.isEmpty ? "Please Enter Your Email" : null,
              ),
            ),
            const SizedBox(height: 10),
            FadeInLeft(
              duration: const Duration(milliseconds: 1200),
              child: _buildPasswordField(
                controller: _passwordController,
                hintText: "Password",
                isVisible: _isPasswordVisible,
                toggleVisibility: () {
                  setState(() => _isPasswordVisible = !_isPasswordVisible);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Valid Password";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            FadeInLeft(
              duration: const Duration(milliseconds: 1300),
              child: _buildPasswordField(
                controller: _confirmPasswordController,
                hintText: "Confirm Password",
                isVisible: _isConfirmPasswordVisible,
                toggleVisibility: () {
                  setState(() =>
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
                },
                validator: (value) {
                  if (value!.isEmpty) return "Please Confirm Your Password";
                  if (value != _passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRememberMe(),
                _buildAgreeWithTermsAndConditions(),
              ],
            ),
            const SizedBox(height: 20),
            _buildSignupButton(),
            const SizedBox(height: 20),
            FadeInUp(
              duration: const Duration(milliseconds: 1700),
              child: const Text(
                "Already Have an Account ?",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: kMainTextColor,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorWidth: 1.5,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: _buildOutlineInputBorder(kShadowColor),
        focusedBorder: _buildOutlineInputBorder(kSubMainColor),
        errorBorder: _buildOutlineInputBorder(kRedColor),
        focusedErrorBorder: _buildOutlineInputBorder(kSubMainColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool isVisible,
    required VoidCallback toggleVisibility,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorWidth: 1.5,
      obscureText: !isVisible,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: _buildOutlineInputBorder(kShadowColor),
        focusedBorder: _buildOutlineInputBorder(kSubMainColor),
        errorBorder: _buildOutlineInputBorder(kRedColor),
        focusedErrorBorder: _buildOutlineInputBorder(kSubMainColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        suffixIcon: IconButton(
          onPressed: toggleVisibility,
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: isVisible ? kBlackColor : kGreyColor,
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMe() {
    return FadeInLeft(
      duration: const Duration(milliseconds: 1400),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: _isRememberMe,
            activeColor: kSubMainColor,
            side: const BorderSide(color: kGreyColor, width: 1.5),
            onChanged: (value) {
              setState(() => _isRememberMe = value!);
            },
          ),
          const Text(
            "Remember me for the next time",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: kGreyColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgreeWithTermsAndConditions() {
    return FadeInLeft(
      duration: const Duration(milliseconds: 1500),
      child: Row(
        mainAxisSize: MainAxisSize.min, // minimize the size of the row
        children: [
          Checkbox(
            value: _isTermsAccepted,
            activeColor: kSubMainColor,
            side: const BorderSide(color: kGreyColor, width: 1.5),
            onChanged: (value) {
              setState(() {
                _isTermsAccepted = value!;
              });
            },
          ),
          Row(
            children: [
              const Text(
                'I agree to the ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kGreyColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsAndConditionsScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Terms and Conditions',
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
        ],
      ),
    );
  }

  Widget _buildSignupButton() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1600),
      child: SizedBox(
        width: double.infinity,
        child: CustomButton(
          buttonText: "Sign Up",
          buttonColor1: kMainColor,
          buttonColor2: kSubMainColor,
          buttonTextColor: kWhiteColor,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Perform sign up logic
            }
          },
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: color),
    );
  }
}
