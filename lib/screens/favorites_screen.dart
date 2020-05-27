import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';


class FavoritesScreen extends StatelessWidget {

  final List<Meal> theFavoriteMeals;

  FavoritesScreen(this.theFavoriteMeals);

  @override
  Widget build(BuildContext context) {

    if(theFavoriteMeals.isEmpty){
      return Center(
        child: Text('You have no Favorites yet, start adding some!'),
      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: theFavoriteMeals[index].id,
            title: theFavoriteMeals[index].title,
            imageUrl: theFavoriteMeals[index].imageUrl,
            duration: theFavoriteMeals[index].duration,
            affordability: theFavoriteMeals[index].affordability,
            complexity: theFavoriteMeals[index].complexity,
          );
        },
        itemCount: theFavoriteMeals.length,
      );
    }

  }
}