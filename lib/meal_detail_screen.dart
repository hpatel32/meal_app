import 'package:flutter/material.dart';
import 'dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFav;
  final Function foundFavMeal;
  MealDetailScreen(this.toggleFav, this.foundFavMeal);
  Widget buildSubTitle(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSubTitle('Ingrediants'),
            buildContainer(
              ListView(
                children: <Widget>[
                  for (var i = 0; i < selectedMeal.ingredients.length; i++)
                    Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          selectedMeal.ingredients[i],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                ],
              ),
            ),
            buildSubTitle('Steps'),
            buildContainer(
              ListView(
                children: <Widget>[
                  for (var i = 0; i < selectedMeal.steps.length; i++)
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(i + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[i]),
                    )
                  // Card(
                  //   color: Theme.of(context).accentColor,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Text(
                  //       selectedMeal.steps[i],
                  //       style: TextStyle(
                  //           fontSize: 15, fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                toggleFav(mealId);
              },
              child:
                  Icon(foundFavMeal(mealId) ? Icons.star : Icons.star_border),
            ),
          ],
        ),
      ),
    );
  }
}
