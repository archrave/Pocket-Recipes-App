import 'package:flutter/material.dart';

class MealRecipe extends StatelessWidget {
  static const String routeName = '/recipe-screen';
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = args['id'];
    final title = args['title'];
    return Scaffold(
      appBar: AppBar(title: Text("$title  $id")),
      body: Center(
        child: Text("boyy"),
      ),
    );
  }
}
