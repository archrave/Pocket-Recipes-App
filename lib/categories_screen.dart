import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
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
    );
  }
}
