import 'package:flutter/material.dart';
import 'package:meal_app/Models/Meal.dart';
import 'package:meal_app/Screens/Categorey_Screen.dart';
import 'package:meal_app/Screens/Favourite_Screen.dart';
import 'package:meal_app/Widgets/main_Drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Widget>>? _pages;

  int _selectPageIndex = 0;


  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': const Text("Categories"),
      },
      {
        'page': FavouriateScreen(widget.favoriteMeals),
        'title': const Text("Your Favorites"),
      }
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _pages![_selectPageIndex]['title'] as Widget),
      body: _pages![_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          currentIndex: _selectPageIndex,
          backgroundColor: Colors.pink,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorites",
            ),
          ]),
      drawer: const MainDrawer(),
    );
  }
}
