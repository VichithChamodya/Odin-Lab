import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/constant/sizes.dart';
import 'package:odinlab/services/auth.dart';
import 'package:odinlab/widgets/custom_button.dart';

class SigninScreen extends StatefulWidget {
  // toggle function
  final Function toggle;

  const SigninScreen({super.key, required this.toggle});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  // refference for the auth services class
  final AuthServices _auth = AuthServices();

  bool _isPasswordVisible = false;

  // error message
  String error = "";

  final _formKey = GlobalKey<FormState>();
  final _signinEmailController = TextEditingController();
  final _signinPasswordController = TextEditingController();

  @override
  void dispose() {
    _signinEmailController.dispose();
    _signinPasswordController.dispose();
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
                "Sign In",
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
                controller: _signinEmailController,
                hintText: "Email",
                validator: (value) =>
                    value!.isEmpty ? "Please Enter Your Email" : null,
              ),
            ),
            const SizedBox(height: 10),
            FadeInLeft(
              duration: const Duration(milliseconds: 1100),
              child: _buildPasswordField(
                controller: _signinPasswordController,
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
            const SizedBox(height: 20),
            FadeInLeft(
              duration: const Duration(milliseconds: 1200),
              child: Text(
                error,
                style: const TextStyle(
                  color: kRedColor,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildSignInButton(),
            const SizedBox(height: 30),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: kLisgtShadowColor,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("or",
                      style: TextStyle(
                        color: kGreyColor,
                      )),
                ),
                Expanded(
                  child: Divider(
                    color: kLisgtShadowColor,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset("assets/icons/google.svg"),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () async {
                    //dynamic result =
                    await _auth.signinAnonymously();
                    // if (result == null) {
                    //   print("Error in signing anonymous");
                    // } else {
                    //   print("signin anonymous");
                    //   print(result.uid);
                    // }
                  },
                  child: SvgPicture.asset("assets/icons/anonymous.svg"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            FadeInUp(
              duration: const Duration(milliseconds: 1700),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an Account? ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kMainTextColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // go to signup page
                      widget.toggle();
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: kSubMainColor,
                        decoration: TextDecoration.underline,
                        decorationColor: kSubMainColor,
                      ),
                    ),
                  ),
                ],
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

  Widget _buildSignInButton() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1600),
      child: SizedBox(
        width: double.infinity,
        child: CustomButton(
          buttonText: "Sign In",
          buttonColor1: kMainColor,
          buttonColor2: kSubMainColor,
          buttonTextColor: kWhiteColor,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              // sign-in logic
              dynamic result = await _auth.signinWithEmailAndPassword(
                _signinEmailController.text,
                _signinPasswordController.text,
              );
              if (result == null) {
                setState(() {
                  error = "Invalid Email or Password";
                });
              }
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
