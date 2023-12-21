import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/Category_Item.dart';
import 'package:meal_app/Data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: availableCategories
              .map((catData) => CategoryItem(
                    category: catData,
                  ))
              .toList()),
    );
  }
}
