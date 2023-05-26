import 'package:flutter/material.dart';
import 'package:meal_app/Models/Meal.dart';
import 'package:meal_app/Widgets/Meal_Item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "Category_Meals";

  final List<Meal> _availableMeals;

  const CategoryMealsScreen(
    this._availableMeals,
  );

  @override
  State<CategoryMealsScreen> createState() => CategoryMealsScreenState();
}

class CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayiedMeals;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    displayiedMeals = widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: displayiedMeals!.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            imageUrl: displayiedMeals![index].imageUrl,
            title: displayiedMeals![index].title,
            duration: displayiedMeals![index].duration,
            complexity: displayiedMeals![index].complexity,
            affordability: displayiedMeals![index].affordability,
            id: displayiedMeals![index].id,
          );
        },
      ),
    );
  }
}
