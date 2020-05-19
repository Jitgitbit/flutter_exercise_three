import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({                                                 //---> good example for a const Constructor !
    @required this.id,
    @required this.title,
    this.color = Colors.orange,                                  //---> so orange is now the default
  });
}