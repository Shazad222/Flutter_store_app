import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Model/meal.dart';
import '../widgets/meal_item.dart';

class FavoitesScreen extends StatelessWidget {
  final List<Meal> favoritesMeal;
  FavoitesScreen(this.favoritesMeal);
  @override
  Widget build(BuildContext context) {
    if (favoritesMeal.isEmpty) {
      return Center(
        child: Text('the Favorites'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoritesMeal[index].id,
            title: favoritesMeal[index].title,
            imageUrl: favoritesMeal[index].imageUrl,
            duration: favoritesMeal[index].duration,
            complexity: favoritesMeal[index].complexity,
            affordability: favoritesMeal[index].affordability,
          );
        },
        itemCount: favoritesMeal.length,
      );
    }
  }
}
