import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/pages/dashboard_screen/completed.dart';
import 'package:odinlab/pages/dashboard_screen/ongoing.dart';
import 'package:odinlab/widgets/custom_tab_bar.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: CustomTabBar(
        tabs: ["Ongoing", "Completed"],
        tabViews: [Ongoing(), Completed()],
        indicatorColor: kMainColor,
      ),
    );
  }
}
