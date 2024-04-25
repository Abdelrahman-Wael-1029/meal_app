import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/value_manager.dart';
import 'package:meal_app/view/home/widgets/category_item.dart';
import 'package:meal_app/view/home/widgets/meal_item.dart';
import 'package:meal_app/viewmodel/home/cubit/home_cubit.dart';
import 'package:meal_app/viewmodel/home/cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(SizeManager.s10),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (cubit.categories.isNotEmpty)
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryItem(category: cubit.categories[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: SizeManager.s8,
                        );
                      },
                      itemCount: cubit.categories.length,
                    ),
                  ),
                SizedBox(
                  height: SizeManager.s20,
                ),
                if (cubit.meals.isNotEmpty)
                  Wrap(
                    spacing: SizeManager.s16,
                    runSpacing: SizeManager.s16,
                    children: cubit.meals.map((meal) {
                      return MealItem(meal: meal);
                    }).toList(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
