import 'package:flutter/material.dart';

import '../models/meal.dart';


class FavoritesScreen extends StatelessWidget {

  final List<Meal> theFavoriteMeals;

  FavoritesScreen(this.theFavoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You have no Favorites yet, start adding some!'),
    );
  }
}