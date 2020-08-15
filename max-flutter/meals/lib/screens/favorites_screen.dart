import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;

  FavoritesScreen({@required favorites}) : this.favoritedMeals = favorites;

  @override
  Widget build(BuildContext context) {
    if (favoritedMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - try adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            id: favoritedMeals[idx].id,
            title: favoritedMeals[idx].title,
            imageUrl: favoritedMeals[idx].imageUrl,
            duration: favoritedMeals[idx].duration,
            complexity: favoritedMeals[idx].complexity,
            affordability: favoritedMeals[idx].affordability,
          );
        },
        itemCount: favoritedMeals.length,
      );
    }
  }
}
