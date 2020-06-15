import 'package:flutter/material.dart';
import 'models/meal.dart';
import 'meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favMeal;

  FavoriteScreen(this.favMeal);
  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return Container(
        child: Center(
          child: Text('Favorite meal'),
        ),
      );
    } else {
      return Container(
        child: ListView(
          children: <Widget>[
            for (var i = 0; i < favMeal.length; i++)
              MealItem(
                id: favMeal[i].id,
                title: favMeal[i].title,
                imageUrl: favMeal[i].imageUrl,
                duration: favMeal[i].duration,
                affordability: favMeal[i].affordability,
                complexity: favMeal[i].complexity,
              )
          ],
        ),
      );
    }
  }
}
