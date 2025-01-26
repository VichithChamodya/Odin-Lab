import 'package:flutter/material.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/pages/courses/all_courses.dart';
import 'package:odinlab/pages/courses/free_courses.dart';
import 'package:odinlab/pages/courses/premium_courses.dart';
import 'package:odinlab/widgets/custom_tab_bar.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Software Development"),
      ),
      body: const CustomTabBar(
        tabs: [
          "All Courses",
          "Free Courses",
          "Premium Courses",
        ],
        tabViews: [
          AllCourses(),
          FreeCourses(),
          PremiumCourses(),
        ],
        indicatorColor: kGreenColor,
      ),
    );
  }
}
