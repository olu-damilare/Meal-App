import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import 'categories_screen.dart';
import 'favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': const FavouritesScreen(), 'title': 'Your Favourites'}
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index){
      setState((){
        _selectedPageIndex = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'] as String) ,
        ),
        drawer: const MainDrawer(),
        body: _pages[_selectedPageIndex]['page'] as Widget?,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.shifting,

      selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items:[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
