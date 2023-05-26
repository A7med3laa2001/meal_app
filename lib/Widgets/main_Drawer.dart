import 'package:flutter/material.dart';
import 'package:meal_app/Screens/Filters_Screen.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            color: Colors.amber,
            child: const Text(
              "Cooking Up!!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.pink,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meal" , Icons.restaurant, () {Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile("Filters", Icons.settings,() {Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);})
        ],
      ),
    );
  }

  ListTile buildListTile(String title , IconData icon ,  tabHandler) {
    assert(tabHandler != null);
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          fontFamily: "RobotoCondensed",
        ),
      ),
      onTap: tabHandler,
    );
  }
  }


