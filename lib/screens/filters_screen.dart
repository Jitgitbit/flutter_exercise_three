import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';


class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  Widget _buildSwitchListTile(String title, String description, bool currentValue, Function updateValue){
    return SwitchListTile(
                  title: Text(title),
                  value: currentValue,
                  subtitle: Text(description),
                  onChanged: updateValue,
                );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free', 
                  'Only include gluten-free meals.', 
                  _glutenFree, 
                  (newValue){
                    setState((){
                      _glutenFree = newValue;
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