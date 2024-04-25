import 'package:dio/dio.dart';
import '../../../common/networks/dio_client.dart';
import '../../../core/api_config.dart';
import '../../model/meal.dart';

class MealsApi {
  Future<Response> getMeals() async {
    return DioClient.dio.get(
      ApiConfig.searchMeal,
      queryParameters: {
        's': '',
      },
    );
  }

  Future<Response> getMealById(String id) async {
    return DioClient.dio.get(
      ApiConfig.detailsMeal,
      queryParameters: {
        'i': id,
      },
    );
  }

  Future<Response> getRandomMeal() async {
    return DioClient.dio.get(
      ApiConfig.randomMeal,
    );
  }

  Future<Response> addMeal(Meal meal) async {
    throw UnimplementedError();
  }

  Future<Response> updateMeal(Meal meal) async {
    throw UnimplementedError();
  }

  Future<Response> deleteMeal(Meal meal) async {
    throw UnimplementedError();
  }
}
