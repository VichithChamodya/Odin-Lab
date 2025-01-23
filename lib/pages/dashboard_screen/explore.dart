import 'package:flutter/material.dart';

import 'package:odinlab/widgets/daily_time_goal_card.dart';
import 'package:odinlab/widgets/section_title.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          SectionTitle(title: "Categories"),
          SizedBox(height: 20),
          SectionTitle(title: "Most Popular Courses"),
          SizedBox(height: 20),
          SectionTitle(title: "Recently Added"),
          SizedBox(height: 20),
          SectionTitle(title: "Top Rated"),
        ],
      ),
    );
  }
}
