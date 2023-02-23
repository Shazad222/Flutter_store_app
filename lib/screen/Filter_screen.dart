import 'package:f2/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilter;
  FilterScreen(this.currentFilter, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten']!;
    _glutenFree = widget.currentFilter['lactose']!;

    _glutenFree = widget.currentFilter['vegatarian']!;

    _glutenFree = widget.currentFilter['vegan']!;

    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchListTitle(String title, String description,
      bool currentValue, void Function(bool) function) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" filter page"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedfilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegatarian': _vegetarian,
              };

              widget.saveFilters(selectedfilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTitle(
                "Gluten - free",
                "Only include Gluten-free meals",
                _glutenFree,
                (value) => setState(() {
                  _glutenFree = value;
                }),
              ),
              _buildSwitchListTitle(
                "Lactose - free",
                "Only include Gluten-free meals",
                _lactoseFree,
                (value) => setState(() {
                  _lactoseFree = value;
                }),
              ),
              _buildSwitchListTitle(
                "Vegaterian ",
                "Only include vegetarian meals",
                _vegetarian,
                (value) => setState(() {
                  _vegetarian = value;
                }),
              ),
              _buildSwitchListTitle(
                "Vegan ",
                "Only include Vegan meals",
                _vegan,
                (value) => setState(() {
                  _vegan = value;
                }),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
