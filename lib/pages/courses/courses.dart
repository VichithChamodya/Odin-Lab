import 'package:flutter/material.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/pages/courses/all_courses.dart';
import 'package:odinlab/pages/courses/free_courses.dart';
import 'package:odinlab/pages/courses/premium_courses.dart';
import 'package:odinlab/widgets/custom_tab_bar.dart';

class Courses extends StatelessWidget {
  final String categoryName;

  const Courses({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: CustomTabBar(
          tabs: const [
            "All Courses",
            "Free Courses",
            "Premium Courses",
          ],
          tabViews: [
            AllCourses(categoryName: categoryName),
            FreeCourses(categoryName: categoryName),
            PremiumCourses(categoryName: categoryName),
          ],
          indicatorColor: kSubMainColor,
        ),
      ),
    );
  }
}
