import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import '../../../core/value_manager.dart';
import '../../../data/model/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CachedNetworkImageBuilder(
                  url: meal.imageUrl,
                  builder: (imageFile) {
                    return Center(
                      child: Image.file(
                        width: double.infinity,
                        height: double.infinity,
                        imageFile,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ],
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
    );
  }
}
