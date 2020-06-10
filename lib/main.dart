import 'package:flutter/material.dart';
import 'package:meal_app/categories_screen.dart';
import 'package:meal_app/category_meal_screen.dart';
import 'package:meal_app/filter_screen.dart';
import 'package:meal_app/meal_detail_screen.dart';
import 'tabs_screen.dart';
import 'package:meal_app/dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarina': false,
  };
  List<Meal> availableMeal = DUMMY_MEALS;

  void setFilter(Map<String, bool> passedFilter) {
    setState(() {
      filters = passedFilter;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (filters["gluten"] && meal.isGlutenFree) return false;
        if (filters["lactose"] && meal.isLactoseFree) return false;
        if (filters["vegan"] && meal.isVegan) return false;
        if (filters["vegetarian"] && meal.isVegetarian) return false;

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      //home: MyHomePage(),
      routes: {
        '/': (context) => MyHomePage(),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(availableMeal),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.routeName: (context) => FilterScreen(filters, setFilter),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarScreen(),
    );
  }
}
