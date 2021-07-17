import 'package:flutter/material.dart';
import './meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String itemTitle;
  final Color itemColor;

  CategoryItem({this.itemTitle, this.itemColor});

  void selectCategory(BuildContext ctx) {
    // Navigator feature HELPS to navigate between screens
    // Adds another screen on top of the screen before, like a stack
    // Screens are practically alligned using stack
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return MealsScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    //Inkwell is basically a GestureDetector() but w a cool default animation
    return InkWell(
      //Forwarding build() methods context to the function used
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius:
          BorderRadius.circular(15), //To match the shape of container below
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(itemTitle),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              itemColor.withOpacity(0.7),
              itemColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
