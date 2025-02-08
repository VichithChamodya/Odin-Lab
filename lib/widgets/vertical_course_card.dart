import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/pages/courses/course_details/course_details.dart';

class VerticalCourseCard extends StatelessWidget {
  final String courseId;
  final String courseName;
  final String courseAbout;
  final String courseImage;
  final bool isPremium;
  final double courseRating;

  const VerticalCourseCard({
    super.key,
    required this.courseId,
    required this.courseName,
    required this.courseAbout,
    required this.courseImage,
    required this.isPremium,
    required this.courseRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseDetailPage(courseId: courseId),
            ),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(1),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: isPremium
                    ? const LinearGradient(
                        colors: [kGreenColor, kSubMainColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: Theme.of(context).appBarTheme.backgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x20000000),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    child: Image.network(
                      courseImage,
                      height: 65,
                      width: 100,
                      fit: BoxFit.cover,
                      // if image fails to load
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                          height: 65,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: kGreyColor,
                              ),
                              Text(
                                "Error loading image",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: kGreyColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                              const Spacer(),
                              const Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                courseRating.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: isPremium ? kWhiteColor : kGreyColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            courseAbout,
                            style: TextStyle(
                              fontSize: 12,
                              height: 1,
                              fontWeight: FontWeight.w400,
                              color: isPremium ? kWhiteColor : kGreyColor,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isPremium)
              Positioned(
                top: 5,
                left: -10,
                child: Transform.rotate(
                  angle: -0.5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        colors: [kBlackColor, kSubMainColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: kGreenColor,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.workspace_premium,
                          color: kWhiteColor,
                          size: 14,
                        ),
                        Text(
                          "Premium",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black38,
                                offset: Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
