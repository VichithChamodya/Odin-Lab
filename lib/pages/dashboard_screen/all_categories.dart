import 'package:flutter/material.dart';
import 'package:odinlab/data/category_data.dart';
import 'package:odinlab/models/category_model.dart';
import 'package:odinlab/pages/courses/courses.dart';
import 'package:odinlab/widgets/category_card.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    // get category list
    final categories = CategoryData().categoryList;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            clipBehavior: Clip.none,
            padding: const EdgeInsets.symmetric(vertical: 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 5,
              childAspectRatio: 6 / 1,
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
        ),
      ),
    );
  }
}
