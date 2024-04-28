import 'package:flutter/material.dart';
import 'package:meal_app/common/widget/image.dart';
import 'package:meal_app/core/color_manager.dart';
import 'package:meal_app/core/value_manager.dart';
import 'package:meal_app/data/model/meal.dart';

// ignore: must_be_immutable
class MealDetails extends StatefulWidget {
  final Meal meal;
  static const String routeName = '/meal_details';

  const MealDetails({
    super.key,
    required this.meal,
  });

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(PaddingManager.p8),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorManager.white,
                  ),
                  alignment: Alignment.center,
                  child: IconButton(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 17,
                      color: ColorManager.lightblack,
                    ),
                    color: ColorManager.black,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                expandedHeight: SizeManager.s100,
                flexibleSpace: FlexibleSpaceBar(
                  background: getImage(
                    url: widget.meal.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.meal.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: SizeManager.s8,
                ),
                OverflowBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  overflowSpacing: 10,
                  children: [
                    for (var i = 0; i < widget.meal.tags.length; i++)
                      Container(
                        color: ColorManager.grey,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(
                          widget.meal.tags[i],
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: ColorManager.white,
                              ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: SizeManager.s8,
                ),
                OverflowBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 1.0,
                          color: ColorManager.grey,
                        ),
                      ),
                      child: OverflowBar(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: ColorManager.lightblack,
                            ),
                            onPressed: () {
                              if (count > 1) {
                                count--;
                                setState(() {});
                              }
                            },
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            count.toString(),
                            style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: ColorManager.black,
                                    ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: ColorManager.lightblack,
                            ),
                            onPressed: () {
                              count++;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$${widget.meal.price * count}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeManager.s12,
                ),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      IntrinsicHeight(
                        child: TabBar(
                          labelColor: ColorManager.white,
                          indicator: BoxDecoration(
                            color: ColorManager.lightblack,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          unselectedLabelColor: ColorManager.black,
                          overlayColor:
                              WidgetStateProperty.all<Color>(Colors.transparent),
                          tabs: [
                            Tab(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  'Details',
                                  style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .fontSize,
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  'Cooking',
                                  style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .fontSize,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 2000,
                        child: TabBarView(
                          children: [
                            Text(
                              widget.meal.Instructions,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              widget.meal.Instructions,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1.0,
                  color: ColorManager.grey,
                ),
                color: ColorManager.white,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: ColorManager.red,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Add to cart',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
