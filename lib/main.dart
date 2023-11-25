import 'package:flutter/material.dart';
import 'package:meal_app/Screens/Category_Meals_Screen.dart';
import 'package:meal_app/Screens/Filters_Screen.dart';
import 'package:meal_app/Screens/Meal_Details_Screen.dart';
import 'package:meal_app/Data/dummy_data.dart';

import 'Models/Meal.dart';
import 'Screens/Tabs_Screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String , bool> _Filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];


   void _setFilters(Map<String , bool> _FiltersData) {
    setState(() {
      _Filters = _FiltersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_Filters['gluten']! && !meal.isGlutenFree) {
          return false;
        };
        if (_Filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_Filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_Filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }
   void _toggleFavorite(String mealId){
     final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId );

     if(existingIndex >= 0){
       setState(() {
         _favoriteMeals.removeAt(existingIndex);
       });
     }else{
       setState(() {
         _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
       });
     }
   }
   bool _isMealFavorite(String id){
     return _favoriteMeals.any((meal) => meal.id == id );
   }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
            canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
      routes: {
        '/' : (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routeName: (context) => FilterScreen( _setFilters , _Filters),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
      ),
      body: null
    );
  }
}
