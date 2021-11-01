import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_details.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/models/meal.dart';


import 'dummy_data.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filteredData){
    setState((){
      _filters = filteredData;
      _availableMeals = DUMMY_MEALS.where((meal){
        if(_filters['gluten'] == true && !meal.isGlutenFree){
            return false;
        }
        if(_filters['lactose'] == true && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] == true && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] == true && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.orange,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
          ),
          subtitle1: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        )
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(),
        FiltersScreen.routeName : (ctx) => FiltersScreen(_filters, _setFilters),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen()
      },
      onGenerateRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
