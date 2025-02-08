import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/models/course_model.dart';
import 'package:odinlab/services/course_service.dart';
import 'package:odinlab/widgets/vertical_course_card.dart';

class FreeCourses extends StatelessWidget {
  final String categoryName;

  const FreeCourses({
    super.key,
    required this.categoryName,
  });

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
            // filter courses by category name and ispremium
            final List<CourseModel> courses = snapshot.data!
                .where((course) =>
                    course.courseCategory == categoryName &&
                    course.isPremium == false)
                .toList();

            // check if filtered courses are empty
            if (courses.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Lottie.asset(
                      "assets/lotties/empty.json",
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "No ${categoryName.toLowerCase()} free courses yet..\nstay tuned !",
                      style: const TextStyle(
                        color: kGreyColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final CourseModel course = courses[index];
                return VerticalCourseCard(
                  courseId: course.courseId,
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
