import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> myfavoriteMeals;

  FavoritesScreen(this.myfavoriteMeals);
  @override
  Widget build(BuildContext context) {
    // Doesn't neccessarily need a Scaffold to load a page, the TabsScreen has
    // it's own Scaffold for that so this works too

    if (myfavoriteMeals.isEmpty)
      return Center(
        child: Text("You have no favorites yet."),
      );
    else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              mealId: myfavoriteMeals[index].id,
              mealTitle: myfavoriteMeals[index].title,
              imgUrl: myfavoriteMeals[index].imageUrl,
              mealDuration: myfavoriteMeals[index].duration,
              mealComplexity: myfavoriteMeals[index].complexity,
              mealAffordability: myfavoriteMeals[index].affordability,
            );
          },
          itemCount: myfavoriteMeals.length);
    }
  }
}
