import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/pages/courses/all_courses.dart';
import 'package:odinlab/pages/courses/free_courses.dart';
import 'package:odinlab/pages/courses/premium_courses.dart';
import 'package:odinlab/widgets/custom_tab_bar.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomTabBar(
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
      indicatorColor: kMainColor,
    );
  }
}
