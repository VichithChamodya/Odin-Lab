import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class About extends StatelessWidget {
  final String courseAbout;
  final String courseDescription1;
  final List courseKeyFeatures;
  final String courseImage;
  final String courseDescription2;
  final String courseDescription3;

  const About({
    super.key,
    required this.courseAbout,
    required this.courseDescription1,
    required this.courseKeyFeatures,
    required this.courseImage,
    required this.courseDescription2,
    required this.courseDescription3,
  });

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
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),

            Text(
              courseAbout,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kGreyColor,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Key Highlights:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: kGreyColor,
              ),
            ),
            const SizedBox(height: 5),

            // bullet points
            for (var i = 0; i < courseKeyFeatures.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle,
                        color: kSubMainColor, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        courseKeyFeatures[i],
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20),

            // image section
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(courseImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              courseDescription1,
              style: const TextStyle(
                fontSize: 12,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 20),

            Text(
              courseDescription2,
              style: const TextStyle(
                fontSize: 12,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),

            // additional description
            Text(
              courseDescription3,
              style: const TextStyle(
                fontSize: 12,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
