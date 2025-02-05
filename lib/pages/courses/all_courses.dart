import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  // lottie animation
                  Lottie.asset(
                    "assets/lotties/error.json",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Oops! Something went wrong",
                    style: TextStyle(
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  // lottie animation
                  Lottie.asset(
                    "assets/lotties/empty.json",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    "No courses avalable",
                    style: TextStyle(
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
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