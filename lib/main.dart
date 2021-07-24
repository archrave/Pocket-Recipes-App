import 'package:flutter/material.dart';
import './screens/meal_recipe_screen.dart';
import './screens/categories_screen.dart';
import './screens/meals_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (ctx) => TabsScreen(),
        //    '/meals-screen': (ctx) => MealsScreen(),
        // Better way is to store this random name in the given widget class itself

        MealsScreen.routeName: (ctx) => MealsScreen(),
        MealRecipe.routeName: (ctx) => MealRecipe(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },

      //Following function is used to navigate to the specified screen(Categories Screen here), if a route isnt registered above
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },

      //Following function is a last resort to prevent errors while navigating
      //Much like a 404 error page in a website
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}
