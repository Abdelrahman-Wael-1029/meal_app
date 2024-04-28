import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/common/widget/image.dart';
import 'package:meal_app/data/model/category.dart';
import 'package:meal_app/data/model/meal_category.dart';
import 'package:meal_app/view/meal_details/screens/meal_details.dart';
import 'package:meal_app/viewmodel/home/cubit/home_cubit.dart';

class CategoryDetails extends StatelessWidget {
  final Category category;
  final List<MealCategory> meals;
  static const String routeName = '/category-details';

  const CategoryDetails({
    super.key,
    required this.category,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: getImage(
                url: meal.imageUrl,                
              ),
            ),
            titleTextStyle: Theme.of(context).textTheme.headlineMedium,
            title: Text(meal.name),
            onTap: () async {
              cubit.getMealById(meal.id).then((value) {
                Navigator.pushNamed(
                  context,
                  MealDetails.routeName,
                  arguments: value,
                );
              });
            },
          );
        },
      ),
    );
  }
}
