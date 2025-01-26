import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
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
    return Column(
      children: [
        TabBar(
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
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              // Replace with your actual content widgets
              Center(child: Text('All Courses')),
              Center(child: Text('Free Courses Content')),
              Center(child: Text('Premium Courses Content')),
            ],
          ),
        ),
      ],
    );
  }
}
