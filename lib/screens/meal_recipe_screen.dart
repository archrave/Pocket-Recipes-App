import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealRecipe extends StatelessWidget {
  static const String routeName = '/recipe-screen';
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mId = args['id'];
    final mTitle = args['title'];

    Widget createHeading(BuildContext ctx, String heading) {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Text(heading, style: Theme.of(context).textTheme.title),
      );
    }

    Widget createContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.grey)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 280,
        width: 350,
        child: child,
      );
    }

    //firstWhere gives only one item
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == mId);
    return Scaffold(
        appBar: AppBar(title: Text(mTitle)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 310,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
              ),
              createHeading(context, 'Ingredients'),
              createContainer(ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              )),
              createContainer(ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                            child: Text(
                          ' ${(index + 1)}.',
                        )),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            Navigator.of(context).pop(args);
          },
        ));
  }
}
