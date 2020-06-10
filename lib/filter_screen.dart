import 'package:flutter/material.dart';
import 'package:meal_app/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = '/filter';

  final Function setFilter;
  final Map<String, bool> currentFilter;

  FilterScreen(this.currentFilter, this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegeterian = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = true;
    _vegan = false;
    _vegeterian = false;
    _lactoseFree = false;
    // _glutenFree = widget.currentFilter['gluten'];
    // _vegan = widget.currentFilter['vegan'];
    // _vegeterian = widget.currentFilter['vegetarian'];
    // _lactoseFree = widget.currentFilter['lactose'];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorite'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final filter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarina': _vegeterian,
                };
                widget.setFilter(filter);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal choice',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: Text("Gluten free meal"),
                  subtitle: Text('This will show only gluten free meal'),
                  value: _glutenFree,
                  onChanged: (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Lactose free meal"),
                  subtitle: Text('This will show only lactose free meal'),
                  value: _lactoseFree,
                  onChanged: (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Vegetarian meal"),
                  subtitle: Text('This will show only vegetarian meal'),
                  value: _vegeterian,
                  onChanged: (val) {
                    setState(() {
                      _vegeterian = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Vegan meal"),
                  subtitle: Text('This will show only vegan meal'),
                  value: _vegan,
                  onChanged: (val) {
                    setState(() {
                      _vegan = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
