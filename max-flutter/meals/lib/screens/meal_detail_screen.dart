import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final List<Meal> _availableMeals;

  MealDetailScreen(this._availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final selectedMeal =
        _availableMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, idx) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[idx]),
                    ),
                  );
                },
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, idx) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '${idx + 1}',
                          ),
                        ),
                        title: Text(selectedMeal.steps[idx]),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () => Navigator.of(context).pop(mealId),
      ),
    );
  }
}
