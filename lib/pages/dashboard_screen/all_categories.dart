import 'package:flutter/material.dart';
import 'package:odinlab/data/category_data.dart';
import 'package:odinlab/models/category_model.dart';
import 'package:odinlab/widgets/category_card.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    // get category list
    final categories = CategoryData().categoryList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            clipBehavior: Clip.none,
            padding: const EdgeInsets.symmetric(horizontal: 4),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
