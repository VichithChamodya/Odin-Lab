import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor1;
  final Color buttonColor2;
  final Color buttonTextColor;
  final Function() onPressed;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonColor1,
    required this.buttonColor2,
    this.buttonTextColor = kWhiteColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.065,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [buttonColor1, buttonColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: kShadowColor,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: buttonTextColor,
          ),
        ),
      ),
    );
  }
}
