import 'package:flutter/material.dart';
import 'package:odinlab/widgets/custom_tab_bar.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  Widget build(BuildContext context) {
    return const CustomTabBar();
  }
}
