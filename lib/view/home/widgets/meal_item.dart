import 'package:flutter/material.dart';
import '../../../common/widget/image.dart';
import '../../meal_details/screens/meal_details.dart';
import '../../../core/value_manager.dart';
import '../../../data/model/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MealDetails.routeName, arguments: meal);
      },
      child: SizedBox(
        height: 250,
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: getImage(
                url: meal.imageUrl,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            SizedBox(
              height: SizeManager.s10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    meal.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text(
                  "${meal.price.toString()}\$",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
