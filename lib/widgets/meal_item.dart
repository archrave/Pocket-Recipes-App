import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String mealTitle;
  final String imgUrl;
  final int mealDuration;
  final Complexity mealComplexity;
  final Affordability mealAffordability;

  String get complexityText {
    switch (mealComplexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (mealAffordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

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
                  Positioned(
                    bottom: 20,
                    left: 1,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Text(
                        mealTitle,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text('$mealDuration min'),
                      ]),
                      Row(children: [
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text(complexityText),
                      ]),
                      Row(children: [
                        Icon(Icons.money),
                        SizedBox(width: 6),
                        Text('$affordabilityText'),
                      ]),
                    ],
                  ))
            ],
          ),
        ));
  }
}
