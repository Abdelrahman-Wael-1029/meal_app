import 'package:flutter/foundation.dart';
import '../../data/api/meals/meals_api.dart';
import '../../data/model/meal.dart';

class MealRepository {
  final MealsApi mealsApi;
  MealRepository(this.mealsApi);

  Future<List<Meal>> getMeals() async {
    try {
      final response = await mealsApi.getMeals();
      return (response.data['meals'] as List)
          .map((e) => Meal.fromJson(e))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  Future<Meal> getMealById(String id) async {
    try {
      final response = await mealsApi.getMealById(id);
      return Meal.fromJson(response.data['meals'][0]);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<List<Meal>> getMealsByCategory(String category) async {
    try {
      final response = await mealsApi.getMealsByCategory(category);
      return (response.data['meals'] as List)
          .map((e) => Meal.fromJson(e))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<Meal> getRandomMeal() async {
    try {
      final response = await mealsApi.getRandomMeal();
      return Meal.fromJson(response.data['meals'][0]);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
