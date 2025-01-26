import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/pages/courses/all_courses.dart';
import 'package:odinlab/pages/courses/free_courses.dart';
import 'package:odinlab/pages/courses/premium_courses.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> courseTabs = [
    "All Courses",
    "Free Courses",
    "Premium Courses",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: courseTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: kBlackColor,
              unselectedLabelColor: kGreyColor,
              indicatorColor: kMainColor,
              indicatorPadding: const EdgeInsets.only(bottom: 10),
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              tabs: courseTabs.map((tab) => Tab(text: tab)).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                AllCourses(),
                FreeCourses(),
                PremiumCourses(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
