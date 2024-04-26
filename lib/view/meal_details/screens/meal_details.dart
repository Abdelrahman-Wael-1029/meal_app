import 'package:flutter/material.dart';
import 'package:meal_app/data/model/meal.dart';

class MealDetails extends StatelessWidget {
  final Meal meal;

  const MealDetails({super.key, required this.meal,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
      ),
      body: Column(
        children: <Widget>[
          Image.network(meal.imageUrl),
          Text(meal.name),
          Text(meal.price.toString()),
        ],
      ),
    );
  }
}