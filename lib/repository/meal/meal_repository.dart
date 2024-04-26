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
    if (response.data == null || response.data == [] || response.data['meals'] == null) {
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

  Future<List<Meal>> getMealsByCategory(String category) async {
    final response = await mealsApi.getMealsByCategory(category);
    return (response.data['meals'] as List)
        .map((e) => Meal.fromJson(e))
        .toList();
  }

  Future<Meal> getRandomMeal() async {
    final response = await mealsApi.getRandomMeal();
    return Meal.fromJson(response.data['meals'][0]);
  }
}
