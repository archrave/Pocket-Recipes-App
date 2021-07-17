import 'package:flutter/material.dart';
import './widgets/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Recipes',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CategoriesScreen(),
    );
  }
}
