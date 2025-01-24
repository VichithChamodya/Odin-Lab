import 'package:flutter/material.dart';
import 'package:odinlab/models/category_model.dart';

class CategoryData {
  final List<CategoryModel> categoryList = [
    CategoryModel(
      categoryIcon: Icons.developer_mode,
      categoryName: "Software Development",
    ),
    CategoryModel(
      categoryIcon: Icons.language,
      categoryName: "Web Development",
    ),
    CategoryModel(
      categoryIcon: Icons.smartphone,
      categoryName: "Mobile Development",
    ),
    CategoryModel(
      categoryIcon: Icons.bar_chart,
      categoryName: "Data Science",
    ),
    CategoryModel(
      categoryIcon: Icons.memory,
      categoryName: "AI & Machine Learning",
    ),
    CategoryModel(
      categoryIcon: Icons.cloud_circle,
      categoryName: "Cloud Computing",
    ),
    CategoryModel(
      categoryIcon: Icons.shield_moon_outlined,
      categoryName: "Cybersecurity",
    ),
    CategoryModel(
      categoryIcon: Icons.settings,
      categoryName: "DevOps",
    ),
    CategoryModel(
      categoryIcon: Icons.sports_esports,
      categoryName: "Game Development",
    ),
    CategoryModel(
      categoryIcon: Icons.token,
      categoryName: "Blockchain & Web3",
    ),
    CategoryModel(
      categoryIcon: Icons.design_services,
      categoryName: "UI/UX Design",
    ),
    CategoryModel(
      categoryIcon: Icons.smart_toy,
      categoryName: "Robotics and IoT",
    ),
    CategoryModel(
      categoryIcon: Icons.brush,
      categoryName: "Graphic Design",
    ),
    CategoryModel(
      categoryIcon: Icons.bug_report,
      categoryName: "Software Testing & QA",
    ),
  ];
}
