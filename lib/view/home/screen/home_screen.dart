import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/common/widget/text_field.dart';
import '../../../core/value_manager.dart';
import '../widgets/category_item.dart';
import '../widgets/meal_item.dart';
import '../../../viewmodel/home/cubit/home_cubit.dart';
import '../../../viewmodel/home/cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.all(SizeManager.s10),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                getTextField(
                  context,
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search),
                  onChanged: (value) {
                    cubit.getMealsBySearch(value);
                  },
                  
                ),
                SizedBox(
                  height: SizeManager.s20,
                ),
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
                if (cubit.categories.isNotEmpty)
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
