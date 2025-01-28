import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class Lessons extends StatelessWidget {
  const Lessons({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          "Section 1 - Introduction",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _buildLessonTile("01", "Introduction to Design Thinking", "10:00"),
        _buildLessonTile("02", "Empathy in Design", "5:00"),
        const SizedBox(height: 16),
        const Text(
          "Section 2 - Fundamentals",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _buildLessonTile("01", "The Process of Ideation", "15:00"),
      ],
    );
  }

  Widget _buildLessonTile(String number, String title, String duration) {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                number,
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
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "$duration Min",
                    style: const TextStyle(
                      color: kGreyColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.play_circle_fill, color: kSubMainColor),
          ],
        ),
      ),
    );
  }
}
