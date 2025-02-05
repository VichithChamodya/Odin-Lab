import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/models/course_model.dart';
import 'package:odinlab/services/course_service.dart';

import 'package:odinlab/widgets/vertical_course_card.dart';

class AllCourses extends StatefulWidget {
  const AllCourses({super.key});

  @override
  State<AllCourses> createState() => _AllCoursesState();
}

class _AllCoursesState extends State<AllCourses> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: StreamBuilder(
        stream: CourseService().getCourse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: kSubMainColor,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error loading courses"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No courses avalable"),
            );
          } else {
            final List<CourseModel> courses = snapshot.data!;
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final CourseModel course = courses[index];
                return VerticalCourseCard(
                  courseName: course.courseName,
                  courseAbout: course.courseAbout,
                  courseImage: course.courseImage,
                  isPremium: course.isPremium,
                  courseRating: course.courseRating,
                );
              },
            );
          }
        },
      ),
    );
  }
}

// Column(
      //   children: [
      // VerticalCourseCard(
      //     courseName: courseName,
      //     courseAbout: courseAbout,
      //     courseImage: courseImage,
      //     isFree: isFree,
      //     courseRating: courseRating),
      //   ],
      // ),