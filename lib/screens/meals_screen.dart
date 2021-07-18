import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class MealsScreen extends StatelessWidget {
  static const String routeName =
      '/meals-screen'; //WIll be using this in the main.dart

  // final String categoryId;
  // final String categoryTitle;
  // MealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    /* Below we're filtering out the meals for the selected category by 
    checking all the meals' categoryList argument, if it contains the categoryId that we selected */

    final categoryMeals = DUMMY_MEALS.where((eachMeal) {
      return eachMeal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                mealTitle: categoryMeals[index].title,
                imgUrl: categoryMeals[index].imageUrl,
                mealDuration: categoryMeals[index].duration,
                mealComplexity: categoryMeals[index].complexity,
                mealAffordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length),
    );
  }
}
