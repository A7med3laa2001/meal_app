import 'package:flutter/material.dart';

import '../Models/Meal.dart';
import '../Widgets/Meal_Item.dart';

class FavouriateScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavouriateScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text(
            "You have not favorite meals yet - please add some!!",
          style: TextStyle(fontSize: 16),
        ),
      );
    }else{
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            imageUrl: favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            id: favoriteMeals[index].id,
          );
        },
      );
    }
  }
}
