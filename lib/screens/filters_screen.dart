import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
        body: Center(child: Text('Filters'),));
  }
}
