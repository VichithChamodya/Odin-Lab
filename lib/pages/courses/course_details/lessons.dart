import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/models/lesson_model.dart';

class Lessons extends StatelessWidget {
  final List<LessonModel> courseLessons;

  const Lessons({
    super.key,
    required this.courseLessons,
  });

  @override
  Widget build(BuildContext context) {
    if (courseLessons.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/lotties/empty.json",
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const Text(
              "No lessons available",
              style: TextStyle(
                color: kGreyColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Lessons Overview",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courseLessons.length,
            itemBuilder: (context, index) {
              final lesson = courseLessons[index];
              return Container(
                height: 55,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0x180095FF),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.blue.shade200,
                        child: Text(
                          "${index + 1}",
                          style: const TextStyle(
                            color: kSubMainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lesson.lessonName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const Text(
                              "5 Min",
                              style: TextStyle(
                                color: kGreyColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.play_circle_fill,
                        color: kSubMainColor,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
