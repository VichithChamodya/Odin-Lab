import 'package:flutter/material.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/data/category_data.dart';
import 'package:odinlab/models/category_model.dart';
import 'package:odinlab/models/course_model.dart';
import 'package:odinlab/pages/dashboard_screen/all_categories.dart';
import 'package:odinlab/pages/courses/courses.dart';
import 'package:odinlab/widgets/horizontal_course_card.dart';
import 'package:odinlab/widgets/daily_time_goal_card.dart';
import 'package:odinlab/widgets/section_title.dart';
import 'package:odinlab/widgets/category_card.dart';
import 'package:odinlab/widgets/vertical_course_card.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  // list of categories
  final categories = CategoryData().categoryList;

  // state to toggle between horizontal and vertical view of categories
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // categorizing the courses
    // CourseCategorizer categorizer = CourseCategorizer(recommendedCourses);

    // List<CourseModel> mostPopularCourses = categorizer.getMostPopularCourses();
    // List<CourseModel> recommendedCoursesList =
    //     categorizer.getRecommendedCourses();
    // List<CourseModel> recentlyAddedCourses =
    //     categorizer.getRecentlyAddedCourses();
    // List<CourseModel> topRatedCourses = categorizer.getTopRatedCourses();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          // daily time goal card
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: DailyTimeGoalCard(
              progressValue: 0.6,
              timeGoal: 15,
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SectionTitle(
              title: "Categories",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllCategories(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 5),

          // conditional rendering of category list
          if (!isExpanded)
            // horizontal list view for categories
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.055,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  CategoryModel category = categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CategoryCard(
                      categoryIcon: category.categoryIcon,
                      categoryName: category.categoryName,
                      categoryOnTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Courses(
                              categoryName: category.categoryName,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          else
            // grid view for categories when expanded
            GridView.builder(
              shrinkWrap: true,
              clipBehavior: Clip.none,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                childAspectRatio: 4 / 1,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                CategoryModel category = categories[index];
                return CategoryCard(
                  categoryIcon: category.categoryIcon,
                  categoryName: category.categoryName,
                  categoryOnTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Courses(
                          categoryName: category.categoryName,
                        ),
                      ),
                    );
                  },
                );
              },
            ),

          // button to show more / show less
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded; // toggle the state
                });
              },
              child: Text(
                isExpanded ? "Show Less" : "Show More",
                style: const TextStyle(
                  color: kSubMainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // section for courses for you
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SectionTitle(
              title: "Courses for You",
              onTap: () {},
            ),
          ),
          const SizedBox(height: 5),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.26,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     padding: const EdgeInsets.symmetric(horizontal: 15),
          //     itemCount: recommendedCoursesList.length,
          //     itemBuilder: (context, index) {
          //       CourseModel course = recommendedCoursesList[index];
          //       return const HorizontalCourseCard();
          //     },
          //   ),
          // ),

          // most popular courses
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SectionTitle(
              title: "Most Popular Courses",
              onTap: () {},
            ),
          ),
          const SizedBox(height: 5),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.3,
          //   child: ListView.builder(
          //     scrollDirection: Axis.vertical,
          //     physics: const NeverScrollableScrollPhysics(),
          //     padding: const EdgeInsets.symmetric(horizontal: 15),
          //     itemCount: mostPopularCourses.length,
          //     itemBuilder: (context, index) {
          //       CourseModel course = mostPopularCourses[index];
          //       return const VerticalCourseCard();
          //     },
          //   ),
          // ),

          // recently added courses
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SectionTitle(
              title: "Recently Added",
              onTap: () {},
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.26,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: 5,
              itemBuilder: (context, index) {
                return const HorizontalCourseCard(
                  courseName: "courseName",
                  courseAbout:
                      "courseAbout biuvwb ibwvb vnbiwv ubuowasbv uhqwvuw viuewhvue vnuiehv iwdboic owvciev nvuieibvue noieivi jneiv",
                  courseImage:
                      "assets/images/Anime girl headphones desktop computer screen.jpg",
                  isPremium: true,
                  courseRating: 5.2,
                );
              },
            ),
          ),

          // top rated courses
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SectionTitle(
              title: "Top Rated",
              onTap: () {},
            ),
          ),
          const SizedBox(height: 5),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.26,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     padding: const EdgeInsets.symmetric(horizontal: 15),
          //     itemCount: topRatedCourses.length,
          //     itemBuilder: (context, index) {
          //       CourseModel course = topRatedCourses[index];
          //       return const HorizontalCourseCard();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
