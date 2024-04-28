import 'package:meal_app/data/model/meal_category.dart';

import '../../data/api/meals/meals_api.dart';
import '../../data/model/meal.dart';

class MealRepository {
  final MealsApi mealsApi;
  MealRepository(this.mealsApi);

  Future<List<Meal>> getMeals() async {
    final response = await mealsApi.getMeals();
    if (response.data == []) {
      return [];
    }

    return (response.data['meals'] as List)
        .map((e) => Meal.fromJson(e))
        .toList();
  }

  Future getMealsBySearch(String search) async {
    final response = await mealsApi.getMealsBySearch(search);
    if (response.data == null ||
        response.data == [] ||
        response.data['meals'] == null) {
      return [];
    }
    return (response.data['meals'] as List)
        .map((e) => Meal.fromJson(e))
        .toList();
  }

  Future<Meal> getMealById(String id) async {
    final response = await mealsApi.getMealById(id);
    return Meal.fromJson(response.data['meals'][0]);
  }

  Future<List<MealCategory>> getMealsByCategory(String category) async {
    final response = await mealsApi.getMealsByCategory(category);
    if (response.data == null ||
        response.data == [] ||
        response.data['meals'] == null) {
      return [];
    }
    List<MealCategory> meals = [];
    for (var meal in response.data['meals']) {
      meals.add(MealCategory.fromJson(meal));
    }
    return meals;
  }

  Future<Meal> getRandomMeal() async {
    final response = await mealsApi.getRandomMeal();
    return Meal.fromJson(response.data['meals'][0]);
  }
}
