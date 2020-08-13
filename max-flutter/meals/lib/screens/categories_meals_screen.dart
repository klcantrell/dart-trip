import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

import '../models/dummy_data.dart';

class CategoriesMealsScreens extends StatefulWidget {
  static const routeName = '/category-screen';

  @override
  _CategoriesMealsScreensState createState() => _CategoriesMealsScreensState();
}

class _CategoriesMealsScreensState extends State<CategoriesMealsScreens> {
  String _categoryTitle;
  List<Meal> _displayedMeals;
  var _loadedInitialData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitialData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      _displayedMeals = DUMMY_MEALS
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitialData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      _displayedMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            id: _displayedMeals[idx].id,
            title: _displayedMeals[idx].title,
            imageUrl: _displayedMeals[idx].imageUrl,
            duration: _displayedMeals[idx].duration,
            complexity: _displayedMeals[idx].complexity,
            affordability: _displayedMeals[idx].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: _displayedMeals.length,
      ),
    );
  }
}
