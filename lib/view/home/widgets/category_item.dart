import 'package:flutter/material.dart';
import 'package:meal_app/common/widget/image.dart';
import '../../../core/value_manager.dart';
import '../../../data/model/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
