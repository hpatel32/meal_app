import 'package:flutter/material.dart';
import 'package:meal_app/categories_screen.dart';
import 'package:meal_app/category_meal_screen.dart';
import 'package:meal_app/favorite_screen.dart';
import 'package:meal_app/main_drawer.dart';
import 'models/meal.dart';

class TabBarScreen extends StatefulWidget {
  final List<Meal> favMeal;

  TabBarScreen(this.favMeal);
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  List<Map<String, Object>> pages;
  void initState() {
    super.initState();
    pages = [
      {'page': CategoriesScreen(), 'title': 'Category'},
      {'page': FavoriteScreen(widget.favMeal), 'title': 'Your favorites'}
    ];
  }

  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(pages[_selectedPage]['title']),
      ),
      body: pages[_selectedPage]['page'],
    );
  }
}
