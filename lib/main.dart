import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/meal_recipe_screen.dart';
import './screens/categories_screen.dart';
import './screens/meals_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        } else
          return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Recipes',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 18,
                  color: Color.fromRGBO(20, 51, 51, 1)),
              body2:
                  TextStyle(fontSize: 10, color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 22,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'))),
      // home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        //    '/meals-screen': (ctx) => MealsScreen(),
        // Better way is to store this random name in the given widget class itself

        MealsScreen.routeName: (ctx) => MealsScreen(_availableMeals),
        MealRecipe.routeName: (ctx) =>
            MealRecipe(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, setFilters),
      },

      //Following function is used to navigate to the specified screen(Categories Screen here), if a route isnt registered above
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (_) => TabsScreen(_favoriteMeals));
      },

      //Following function is a last resort to prevent errors while navigating
      //Much like a 404 error page in a website
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => TabsScreen(_favoriteMeals));
      },
    );
  }
}
