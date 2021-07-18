import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String mealTitle;
  final String imgUrl;
  final int mealDuration;
  final Complexity mealComplexity;
  final Affordability mealAffordability;

  MealItem(
      {@required this.mealTitle,
      @required this.imgUrl,
      @required this.mealDuration,
      @required this.mealComplexity,
      @required this.mealAffordability});
  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: selectMeal,
        child: Card(
          margin: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Column(
            children: <Widget>[
              //Stack is a widget that allows stuff stacked on top of one another, like an image and some text on top
              Stack(
                children: <Widget>[
                  ClipRRect(
                    // Using this to round the corners of the image
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imgUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
