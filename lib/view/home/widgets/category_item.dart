import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/common/widget/image.dart';
import 'package:meal_app/view/category_details/screen/category_details.dart';
import 'package:meal_app/viewmodel/home/cubit/home_cubit.dart';
import '../../../core/value_manager.dart';
import '../../../data/model/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return InkWell(
      onTap: (){
        cubit.getMealsbyCategory(category.name).then(
              (value) {
                return Navigator.pushNamed(
                context,
                CategoryDetails.routeName,
                arguments: {
                  'category': category,
                  'meals': value,
                },
              );
              },
            );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: getImage(url: category.imageUrl),
          ),
          SizedBox(
            height: SizeManager.s8,
          ),
          Text(
            category.name,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
