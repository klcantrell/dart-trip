import 'package:flutter/material.dart';

class CategoriesMealsScreens extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoriesMealsScreens({
    @required this.categoryId,
    @required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('The Recipes for the Category!'),
      ),
    );
  }
}
