import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> tabViews;
  final Color indicatorColor;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.tabViews,
    required this.indicatorColor,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: widget.indicatorColor,
            indicatorPadding: const EdgeInsets.only(bottom: 10),
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            tabs: widget.tabs.map((tab) => Tab(text: tab)).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.tabViews,
            ),
          ),
        ],
      ),
    );
  }
}
