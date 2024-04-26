import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
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
          child: CachedNetworkImageBuilder(
            url: category.imageUrl,
            builder: (imageFile) {
              return Center(
                child: Image.file(
                  imageFile,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
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
