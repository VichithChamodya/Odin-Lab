import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/data/category_data.dart';
import 'package:odinlab/models/category_model.dart';
import 'package:odinlab/pages/dashboard_screen/all_categories.dart';

import 'package:odinlab/widgets/daily_time_goal_card.dart';
import 'package:odinlab/widgets/section_title.dart';
import 'package:odinlab/widgets/category_card.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  // get category list
  final categories = CategoryData().categoryList;

  // state to toggle between horizontal and vertical view
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DailyTimeGoalCard(
            progressValue: 1,
            timeGoal: 15,
          ),
          const SizedBox(height: 20),
          SectionTitle(
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
          const SizedBox(height: 5),

          // conditional rendering of category list
          if (!isExpanded)
            // horizontal list view
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.055,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  CategoryModel category = categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CategoryCard(
                      categoryIcon: category.categoryIcon,
                      categoryName: category.categoryName,
                    ),
                  );
                },
              ),
            )
          else
            // grid view when expanded
            GridView.builder(
              shrinkWrap: true,
              clipBehavior: Clip.none,
              padding: const EdgeInsets.symmetric(horizontal: 4),
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
                );
              },
            ),

          // show more / show less button
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded; // toggle the state
                });
              },
              child: Text(
                isExpanded ? "show less" : "show more",
                style: const TextStyle(
                  color: kSubMainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          SectionTitle(
            title: "Most Popular Courses",
            onTap: () {},
          ),
          const SizedBox(height: 20),
          SectionTitle(
            title: "Recently Added",
            onTap: () {},
          ),
          const SizedBox(height: 20),
          SectionTitle(
            title: "Top Rated",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
