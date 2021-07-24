import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Doesn't neccessarily need a Scaffold to load a page, the TabsScreen has
    // it's own Scaffold for that so this works too
    return Center(
      child: Text("heelllo here are favorites"),
    );
  }
}
