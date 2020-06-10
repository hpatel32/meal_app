import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/meal_item.dart';
import 'models/meal.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = 'category_meal';
  final List<Meal> availableMeal;

  CategoryMealScreen(this.availableMeal);
//   final String categoryId;
//   final String categoryTitle;

//   CategoryMealScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final pushArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = pushArgs['title'];
    final categoryId = pushArgs['id'];
    final categoryMeal = availableMeal.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            for (var i = 0; i < categoryMeal.length; i++)
              MealItem(
                id: categoryMeal[i].id,
                title: categoryMeal[i].title,
                imageUrl: categoryMeal[i].imageUrl,
                duration: categoryMeal[i].duration,
                affordability: categoryMeal[i].affordability,
                complexity: categoryMeal[i].complexity,
              )
          ],
        ),
      ),
    );
  }
}
