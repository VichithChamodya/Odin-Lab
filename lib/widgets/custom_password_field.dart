import 'package:flutter/material.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/constant/sizes.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isVisible;
  final VoidCallback toggleVisibility;
  final String? Function(String?)? validator;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isVisible,
    required this.toggleVisibility,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorWidth: 1.5,
      obscureText: !isVisible,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: _buildBorder(kShadowColor),
        focusedBorder: _buildBorder(kSubMainColor),
        errorBorder: _buildBorder(kRedColor),
        focusedErrorBorder: _buildBorder(kSubMainColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        suffixIcon: IconButton(
          onPressed: toggleVisibility,
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: isVisible ? kSubMainColor : kGreyColor,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: color),
    );
  }
}
