import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/meal_item.dart';
import '../models/meal.dart';

class MealsScreen extends StatefulWidget {
  static const String routeName = '/meals-screen';
  List<Meal> availableMeals;
  MealsScreen(this.availableMeals);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];

      /* Below we're filtering out the meals for the selected category by 
    checking all the meals' categoryList argument, if it contains the categoryId that we selected */

      displayedMeals = widget.availableMeals.where((eachMeal) {
        return eachMeal.categories.contains(categoryId);
      }).toList();
      super.didChangeDependencies();
    }
    _loadedInitData = true;
  }

  void _removeMeal(Map<String, String> info) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == info['id']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              mealId: displayedMeals[index].id,
              mealTitle: displayedMeals[index].title,
              imgUrl: displayedMeals[index].imageUrl,
              mealDuration: displayedMeals[index].duration,
              mealComplexity: displayedMeals[index].complexity,
              mealAffordability: displayedMeals[index].affordability,
            );
          },
          itemCount: displayedMeals.length),
    );
  }
}
