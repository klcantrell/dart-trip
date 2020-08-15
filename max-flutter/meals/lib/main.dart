import 'package:flutter/material.dart';

import './models/dummy_data.dart';
import './models/meal.dart';

import './screens/categories_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/settings_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _settings = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];

  void _updateSettings(Map<String, bool> settingsData) {
    setState(() {
      _settings = settingsData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_settings['gluten']) {
          return meal.isGlutenFree;
        }
        if (_settings['lactose']) {
          return meal.isLactoseFree;
        }
        if (_settings['vegan']) {
          return meal.isVegan;
        }
        if (_settings['vegetarian']) {
          return meal.isVegetarian;
        }
        return true;
      }).toList();
    });
  }

  bool _isMealFavorite(String mealId) {
    return _favoritedMeals.any((meal) => meal.id == mealId);
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (_) => TabsScreen(favorites: _favoritedMeals),
        CategoriesMealsScreens.routeName: (_) =>
            CategoriesMealsScreens(_availableMeals),
        MealDetailScreen.routeName: (_) => MealDetailScreen(
              availableMeals: _availableMeals,
              toggleFavorite: _toggleFavorite,
              isFavorite: _isMealFavorite,
            ),
        SettingsScreen.routeName: (_) =>
            SettingsScreen(_settings, _updateSettings),
      },
      onUnknownRoute: (_) =>
          MaterialPageRoute(builder: (_) => CategoriesScreen()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
