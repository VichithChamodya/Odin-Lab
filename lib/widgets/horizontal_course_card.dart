import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class HorizontalCourseCard extends StatelessWidget {
  final String courseName;
  final String courseAbout;
  final String courseImage;
  final bool isPremium;
  final double courseRating;

  const HorizontalCourseCard({
    super.key,
    required this.courseName,
    required this.courseAbout,
    required this.courseImage,
    required this.isPremium,
    required this.courseRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // gradient: const LinearGradient(
          //   colors: [
          //     kGreenColor, kSubMainColor
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          // boxShadow: const [
          //   BoxShadow(
          //     color: kShadowColor,
          //     blurRadius: 5,
          //     offset: Offset(0, 2),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                courseImage,
                width: double.infinity,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    courseAbout,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: kGreyColor,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        courseRating.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kGreyColor,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kWhiteColor,
                            foregroundColor: kSubMainColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "View",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
