import 'package:flutter/material.dart';
import 'package:meal_app/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 26,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: ListTile(
              leading: Icon(
                Icons.restaurant,
                size: 26,
              ),
              title: Text(
                'The Meal',
                style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              'Filters',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
