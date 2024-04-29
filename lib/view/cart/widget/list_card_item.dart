import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/common/widget/image.dart';
import 'package:meal_app/core/value_manager.dart';
import 'package:meal_app/view/meal_details/screens/meal_details.dart';
import 'package:meal_app/viewmodel/home/cubit/home_cubit.dart';

Widget listCardItem({
  required BuildContext context,
  required model,
  required Function()? onDelete,
  Widget? subChild,
}) {
  return InkWell(
    onTap: ()  {
      var cubit = context.read<HomeCubit>();
       cubit.getMealById(model.id).then((value) {
        if (value == null) return;
        Navigator.pushNamed(
          context,
          MealDetails.routeName,
          arguments: value,
        );
      });
    },
    child: Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      surfaceTintColor: Theme.of(context).primaryColor,
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            child: getImage(
              url: model.imageUrl,
            ),
          ),
          SizedBox(
            width: SizeManager.s4,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(model.price.toString()),
                if (subChild != null) subChild,
              ],
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    ),
  );
}
