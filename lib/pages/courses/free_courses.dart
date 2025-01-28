import 'package:flutter/material.dart';

import 'package:odinlab/widgets/small_course_card.dart';

class FreeCourses extends StatefulWidget {
  const FreeCourses({super.key});

  @override
  State<FreeCourses> createState() => _FreeCoursesState();
}

class _FreeCoursesState extends State<FreeCourses> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          CourseDetails(),
        ],
      ),
    );
  }
}
