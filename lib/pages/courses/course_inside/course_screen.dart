import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/services/course_service.dart';
import 'package:odinlab/widgets/custom_video_player.dart';
import 'package:odinlab/widgets/test_player.dart';

class CourseScreen extends StatefulWidget {
  final String courseId;
  final String courseName;

  const CourseScreen({
    super.key,
    required this.courseId,
    required this.courseName,
  });

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.courseName,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: StreamBuilder(
        stream: CourseService().getCourse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: kSubMainColor,
                backgroundColor: kGreyColor,
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
                  const Text("No results found"),
                ],
              ),
            );
          } else {
            // filter the course by id
            final course = snapshot.data!.firstWhere(
              (course) => course.courseId == widget.courseId,
            );

            return SimpleVideoPlayer(
              videoUrl: course.courseLessons.first.lessonVideo,
            );
          }
        },
      ),
    );
  }
}
