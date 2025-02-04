import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';


class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';

  final Function saveFilters;

  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);                                  //-----> Constructor need to get Function passed in !

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){                // ! nice data flow !
              final selectedFilters = {
                'lactose': _lactoseFree,
                'gluten': _glutenFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilters);
            },           
          ),
        ],
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
                  'Lactose-free', 
                  'Only include lactose-free meals.', 
                  _lactoseFree, 
                  (newValue){
                    setState((){
                      _lactoseFree = newValue;
                    });
                  },
                ),
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
                _buildSwitchListTile(
                  'Vegetarian', 
                  'Only include vegetarian meals.', 
                  _vegetarian, 
                  (newValue){
                    setState((){
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan', 
                  'Only include vegan meals.', 
                  _vegan, 
                  (newValue){
                    setState((){
                      _vegan = newValue;
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