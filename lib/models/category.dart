import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  const Category(
      {@required this.id, @required this.title, this.color = Colors.orange});
}

/*

=> Constructor marked as const so that the properties in any Category object don't change after creating an object
  for eg. Category(
    id : DateTime.now().toString;
    title: 'Asian',
    color: Colors.blue,
  ).color = Colors.purple;

  Here we're accessing a property after creating the object, so on setting this as const this would give an error


=>  this.orange = Colors.orange is just a default 
    initialisation of the color in case the coder doesn't
    manually pass a color while calling this Category Constructor

=>  On the other hand it is marked compulsary
    to pass an id and a title using @required
*/
