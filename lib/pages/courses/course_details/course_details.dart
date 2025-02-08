import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/models/course_model.dart';
import 'package:odinlab/pages/courses/course_details/about.dart';
import 'package:odinlab/pages/courses/course_details/lessons.dart';
import 'package:odinlab/pages/courses/course_details/reviews.dart';
import 'package:odinlab/pages/courses/course_inside/course_screen.dart';
import 'package:odinlab/services/course_service.dart';
import 'package:odinlab/widgets/course_details_status_item.dart';
import 'package:odinlab/widgets/custom_button.dart';
import 'package:odinlab/widgets/custom_tab_bar.dart';

class CourseDetailPage extends StatelessWidget {
  final String courseId;

  const CourseDetailPage({
    super.key,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const SizedBox(
                    height: 100,
                  ),
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
          }

          // get course details using courseId
          final CourseModel course = snapshot.data!.firstWhere(
            (course) => course.courseId == courseId,
          );

          return Stack(
            children: [
              DefaultTabController(
                length: 3,
                child: Stack(
                  children: [
                    // background image
                    Positioned.fill(
                      child: Image.network(
                        course.courseImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // transparent overlay
                    Positioned.fill(
                      child: Container(
                        color: const Color(0x34000000),
                      ),
                    ),
                    // foreground content
                    NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [
                          // sliver app bar
                          SliverAppBar(
                            expandedHeight: 250,
                            floating: false,
                            pinned: true,
                            backgroundColor: Colors.transparent,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Center(
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(20),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.blue,
                                  ),
                                  icon: const Icon(Icons.play_arrow),
                                  label: const Text(""),
                                ),
                              ),
                            ),
                            leading: IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  color: kWhiteColor),
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  const Color(0x63FFFFFF),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.bookmark_outlined,
                                        color: kRatingColor,
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          const Color(0x63FFFFFF),
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.share,
                                          color: kWhiteColor),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          const Color(0x63FFFFFF),
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.more_vert,
                                          color: kWhiteColor),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          const Color(0x63FFFFFF),
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ];
                      },
                      body: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              // course details section
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // hanger
                                    Center(
                                      child: Container(
                                        height: 6,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: kRatingColor,
                                          size: 14,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "${course.courseRating.toString()} (365 reviews)",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: kGreyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      course.courseName,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CourseDetailsStatusItem(
                                          statusIcon: Icons.category,
                                          statusText: course.courseCategory,
                                        ),
                                        CourseDetailsStatusItem(
                                          statusIcon: Icons.play_lesson,
                                          statusText:
                                              "${course.courseLessons.length} Lessons",
                                        ),
                                        const CourseDetailsStatusItem(
                                          statusIcon: Icons.school,
                                          statusText: "Certificate",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              const Divider(),

                              // tab bar
                              Expanded(
                                child: CustomTabBar(
                                  tabs: const [
                                    "About",
                                    "Hands-on lessons",
                                    "What students say",
                                  ],
                                  tabViews: [
                                    About(
                                      courseAbout: course.courseAbout,
                                      courseDescription1:
                                          course.courseDescription1,
                                      courseKeyFeatures:
                                          course.courseKeyFeatures,
                                      courseImage: course.courseImage,
                                      courseDescription2:
                                          course.courseDescription2,
                                      courseDescription3:
                                          course.courseDescription3,
                                    ),
                                    Lessons(
                                      courseLessons: course.courseLessons,
                                    ),
                                    Reviews(
                                      courseReviews: course.courseReviews,
                                    )
                                  ],
                                  indicatorColor: kSubMainColor,
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
              // Bottom Navigation Bar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildBottomNavigationBar(context, course),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, CourseModel course) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Theme.of(context).appBarTheme.backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Total Price\n",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kGreyColor,
                    ),
                  ),
                  TextSpan(
                    text: course.isPremium
                        ? "\$${course.courseFee.toStringAsFixed(2).toString()}"
                        : "Free",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kSubMainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            buttonText: course.isPremium ? "Enroll Now" : "Start Now",
            buttonColor1: kMainColor,
            buttonColor2: kSubMainColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseScreen(
                    courseId: course.courseId,
                    courseName: course.courseName,
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
