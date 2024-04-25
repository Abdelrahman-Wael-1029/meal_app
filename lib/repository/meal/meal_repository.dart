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

  Future<void> addMeal(Meal meal) async {
    try {
      await mealsApi.addMeal(meal);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> updateMeal(Meal meal) async {
    try {
      await mealsApi.updateMeal(meal);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> deleteMeal(Meal meal) async {
    try {
      await mealsApi.deleteMeal(meal);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  
}
