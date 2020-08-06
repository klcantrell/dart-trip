import 'package:flutter/material.dart';
import 'package:meals/category_item.dart';

import './models/category_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliApp'),
      ),
      body: GridView(
        children: DUMMY_CATEGORIES
            .map((c) => CategoryItem(
                  color: c.color,
                  title: c.title,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
