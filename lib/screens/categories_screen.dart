import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
// import '../models/meal.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  // static const routeName = '/category-screen';
  // List<Meal> availableMeals;
  // CategoriesScreen(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    return
        // No need for Scaffold since the TabsScreen is doing that for us
        // Scaffold(
        //   appBar: AppBar(
        //     title: Text("Pocket Recipes"),
        //   ),
        //   body:
        GridView(
      padding: const EdgeInsets.all(20),
      children: DUMMY_CATEGORIES
          .map(
            (eachItem) => CategoryItem(
              id: eachItem.id,
              title: eachItem.title,
              color: eachItem.color,
            ),
          )
          .toList(),

      //Slivers are basically what makes grids scollable
      //Layouting and stuff is handled by GridDelegated
      //MaxCrossAxisExtent agrument below just defines the width of a grid child in pixels

      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,

        //Defines with width tclearo height ratio of a grid child (i.e 3/2 here)

        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      //),
    );
  }
}
