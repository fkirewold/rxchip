import 'package:flutter/material.dart';

enum TypeOfThing{person,animal}
@immutable 
class Thing {
final String name;
final  TypeOfThing type;
  const Thing({required this.name, required this.type});
}