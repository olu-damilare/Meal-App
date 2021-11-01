import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';
   final Function saveFilters;
   final Map<String, bool> currentFilter;

   FiltersScreen(this.currentFilter, this.saveFilters);


  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}


class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;


  @override
  Widget build(BuildContext context) {

    Widget _buildSwitchListTile(
        String title,
        String desc,
        bool currentValue,
        Function(bool) updateValue
        ){
      return  SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(desc),
        onChanged: updateValue,
        controlAffinity: ListTileControlAffinity.trailing,
      );
    }


    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter'),
          actions: [
             IconButton(icon: const Icon(
                 Icons.save,
             ),
               onPressed: () {
               final selectedFilters = {
                 'gluten': _glutenFree,
                 'lactose': _lactoseFree,
                 'vegan': _vegan,
                 'vegetarian': _vegetarian
               };

             widget.saveFilters(selectedFilters);
               },
             )
          ],
        ),
      drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text('Adjust your meal selection',
              style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals.',
                    _glutenFree,
                      (newValue) {
                      setState((){
                      _glutenFree = newValue;
                    });
                    }
                  ),
                  _buildSwitchListTile(
                      'Lactose-free',
                      'Only include lactose-free meals.',
                      _lactoseFree,
                          (newValue) {
                        setState((){
                          _lactoseFree = newValue;
                        });
                      }
                  ),
                  _buildSwitchListTile(
                      'Vegetarian',
                      'Only include vegetarian meals.',
                      _vegetarian,
                          (newValue) {
                        setState((){
                          _vegetarian = newValue;
                        });
                      }
                  ),
                  _buildSwitchListTile(
                      'Vegan',
                      'Only include vegan meals.',
                      _vegan,
                          (newValue) {
                        setState((){
                          _vegan = newValue;
                        });
                      }
                  )
                ],
              ),
            )
          ],
        )

    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'] as bool;
    _lactoseFree = widget.currentFilter['lactose'] as bool;
    _vegan = widget.currentFilter['vegan'] as bool;
    _vegetarian = widget.currentFilter['vegetarian'] as bool;
    super.initState();
  }
}
