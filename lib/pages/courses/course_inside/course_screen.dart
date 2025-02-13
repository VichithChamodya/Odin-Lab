import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/models/lesson_model.dart';
import 'package:odinlab/pages/courses/course_inside/complete_screen.dart';
import 'package:odinlab/services/course_service.dart';
import 'package:odinlab/widgets/custom_button.dart';
import 'package:odinlab/widgets/custom_video_player.dart';

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
  int _currentPage = 0;

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

            final List<LessonModel> lessons = course.courseLessons;
            final int totalLessons = lessons.length;

            // get the current lesson based on the page
            final currentLesson = lessons[_currentPage];

            return Column(
              children: [
                Expanded(
                  child: CustomVideoPlayer(videoUrl: currentLesson.lessonVideo),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    currentLesson.lessonName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // pagination controls
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _currentPage > 0
                          ? Expanded(
                              child: CustomButton(
                                buttonText: "Previous",
                                buttonColor1: kGreyColor,
                                buttonColor2: kGreyColor,
                                onPressed: _currentPage > 0
                                    ? () {
                                        setState(() {
                                          _currentPage--;
                                        });
                                      }
                                    : null,
                              ),
                            )
                          : const SizedBox(),
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.arrow_back,
                      //     color: _currentPage > 0 ? kSubMainColor : kGreyColor,
                      //   ),
                      //   onPressed: _currentPage > 0
                      //       ? () {
                      //           setState(() {
                      //             _currentPage--;
                      //           });
                      //         }
                      //       : null,
                      // ),
                      Expanded(
                        child: Text(
                          'Lesson ${_currentPage + 1} of $totalLessons',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: kGreyColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          buttonText: _currentPage < totalLessons - 1
                              ? "Next"
                              : "Finish",
                          buttonColor1: _currentPage < totalLessons - 1
                              ? kMainColor
                              : Colors.green,
                          buttonColor2: _currentPage < totalLessons - 1
                              ? kSubMainColor
                              : kGreenColor,
                          onPressed: _currentPage < totalLessons - 1
                              ? () {
                                  setState(() {
                                    _currentPage++;
                                  });
                                }
                              : () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CompleteScreen(),
                                    ),
                                  );
                                },
                        ),
                      ),
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.arrow_forward,
                      //     color: _currentPage < totalLessons - 1
                      //         ? kSubMainColor
                      //         : kGreyColor,
                      //   ),
                      //   onPressed: _currentPage < totalLessons - 1
                      //       ? () {
                      //           setState(() {
                      //             _currentPage++;
                      //           });
                      //         }
                      //       : null,
                      // ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
