import 'package:flutter/material.dart';

import 'package:odinlab/widgets/vertical_course_card.dart';

class PremiumCourses extends StatefulWidget {
  const PremiumCourses({super.key});

  @override
  State<PremiumCourses> createState() => _PremiumCoursesState();
}

class _PremiumCoursesState extends State<PremiumCourses> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          //VerticalCourseCard(),
        ],
      ),
    );
  }
}
