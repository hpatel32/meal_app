import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children: <Widget>[
        for (var i = 0; i < DUMMY_CATEGORIES.length; i++)
          CategoryItem(DUMMY_CATEGORIES[i].id, DUMMY_CATEGORIES[i].title,
              DUMMY_CATEGORIES[i].color),
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
