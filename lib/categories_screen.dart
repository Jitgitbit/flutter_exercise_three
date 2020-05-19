import 'package:flutter/material.dart';
import 'package:flutter_exercise_three/category_item.dart';

import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhoenixMeals'),
      ),
      body: GridView(
        children: DUMMY_CATEGORIES
            .map(
              (catDumData) => CategoryItem(catDumData.title, catDumData.color),
            )
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
