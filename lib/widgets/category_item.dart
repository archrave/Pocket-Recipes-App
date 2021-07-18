import 'package:flutter/material.dart';
import '../screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItem({this.id, this.title, this.color});

  void selectCategory(BuildContext ctx) {
    // Navigator feature HELPS to navigate between screens
    // Adds another screen on top of the screen before, like a stack
    // Screens are practically alligned using stack
    //Following is the direct method for Navigating to other screens

    /*    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
            return MealsScreen(id, title);
       }));     */

    Navigator.of(ctx)
        .pushNamed('/meals-screen', arguments: {'id': id, 'title': title});
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
        child: Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
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
