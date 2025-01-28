import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About This Course",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              "Explore the basics of design thinking and learn how to apply it effectively in real-world scenarios.",
              style: TextStyle(
                fontSize: 16,
                color: kGreyColor,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Key Highlights:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: kGreyColor,
              ),
            ),
            const SizedBox(height: 5),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BulletPoint(
                    text: "Understand the principles of Design Thinking."),
                _BulletPoint(text: "Learn practical tools for brainstorming."),
                _BulletPoint(
                    text: "Apply problem-solving techniques creatively."),
                _BulletPoint(
                    text:
                        "Develop innovative solutions with a user-first approach."),
              ],
            ),
            const SizedBox(height: 20),

            // Image Section (optional)
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/Anime girl headphones desktop computer screen.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // additional Description
            const Text(
              "This course is perfect for aspiring designers, entrepreneurs, and anyone looking to improve their creative problem-solving skills.",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// custom bullet point widget
class _BulletPoint extends StatelessWidget {
  final String text;
  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: kSubMainColor, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
