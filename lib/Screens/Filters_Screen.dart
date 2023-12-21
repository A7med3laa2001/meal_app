import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/main_Drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "Filter_Screen";

  final Function(Map<String,bool>) saveFilters;
  final Map<String, bool> currnetFilters;

  const FilterScreen(
    this.saveFilters,
    this.currnetFilters,
  );

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;


  @override
  void initState() {
    _isGlutenFree = widget.currnetFilters['gluten']!;
    _isLactoseFree = widget.currnetFilters['lactose']!;
    _isVegan = widget.currnetFilters['vegan']!;
    _isVegetarian = widget.currnetFilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };

              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              " Adjust Your Filters",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildFilters(_isGlutenFree, "Gluten-Free",
                    "Is only include Gluten-Free Meals", (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                buildFilters(_isLactoseFree, "Lactose-Free",
                    "Is only include Lactose-Free Meals", (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                buildFilters(_isVegan, "Vegan", "Is only include Vegan Meals",
                    (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
                buildFilters(_isVegetarian, "Vegetarian",
                    "Is only include Vegetarian Meals", (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

  SwitchListTile buildFilters(
      bool currentValue, String title, String subTitle, updateValue) {
    return SwitchListTile(
        title: Text(title),
        activeColor: Colors.pink,
        subtitle: Text(subTitle),
        value: currentValue,
        onChanged: updateValue);
  }
}
