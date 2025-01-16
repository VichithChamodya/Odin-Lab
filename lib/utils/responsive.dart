import 'package:flutter/material.dart';

class Responsive {
  // method to check wether the device is a mobile
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  // method to check wether the device is a tablet
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 850 &&
      MediaQuery.of(context).size.width < 1100;

  // method to check wether the device is a desktop
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}
