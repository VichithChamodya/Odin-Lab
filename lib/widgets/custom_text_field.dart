import 'package:flutter/material.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/constant/sizes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorWidth: 1.5,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: _buildBorder(kShadowColor),
        focusedBorder: _buildBorder(kSubMainColor),
        errorBorder: _buildBorder(kRedColor),
        focusedErrorBorder: _buildBorder(kSubMainColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
