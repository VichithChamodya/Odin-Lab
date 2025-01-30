import 'package:flutter/material.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/pages/courses/course_details/about.dart';
import 'package:odinlab/pages/courses/course_details/lessons.dart';
import 'package:odinlab/pages/courses/course_details/reviews.dart';
import 'package:odinlab/widgets/course_details_status_item.dart';
import 'package:odinlab/widgets/custom_button.dart';
import 'package:odinlab/widgets/custom_tab_bar.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Stack(
          children: [
            // background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/Anime girl headphones desktop computer screen.jpg',
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
                      icon: const Icon(Icons.arrow_back, color: kWhiteColor),
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
                                color: Colors.yellow,
                              ),
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  const Color(0x63FFFFFF),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.share, color: kWhiteColor),
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  const Color(0x63FFFFFF),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.more_vert,
                                  color: kWhiteColor),
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
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
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // hanger
                            Center(
                              child: Container(
                                height: 6,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.star, color: kOrangeColor, size: 14),
                                SizedBox(width: 5),
                                Text(
                                  "4.5 (365 reviews)",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: kGreyColor,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Design Thinking Fundamental",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const SizedBox(height: 8),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CourseDetailsStatusItem(
                                  statusIcon: Icons.category,
                                  statusText: "UI & UX Design",
                                ),
                                CourseDetailsStatusItem(
                                  statusIcon: Icons.play_lesson,
                                  statusText: "32 Lessons",
                                ),
                                CourseDetailsStatusItem(
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
                      const Expanded(
                        child: CustomTabBar(
                          tabs: [
                            "About",
                            "Hands-on lessons",
                            "What students say",
                          ],
                          tabViews: [About(), Lessons(), Reviews()],
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
      bottomNavigationBar: Container(
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
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Total Price\n",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kGreyColor,
                      ),
                    ),
                    TextSpan(
                      text: "\$180.00",
                      style: TextStyle(
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
              buttonText: "Enroll Now",
              buttonColor1: kMainColor,
              buttonColor2: kSubMainColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
