import 'package:dio/dio.dart';

import '../../../common/networks/dio_client.dart';
import '../../../core/api_config.dart';

class MealsApi {
  Future<Response> getMeals() async {
    return DioClient.dio.get(
      "${ApiConfig.baseUrl}${ApiConfig.searchMeal}s=",
    );
  }

  Future<Response> getMealsBySearch(String search) async {
    return DioClient.dio.get(
      ApiConfig.searchMeal,
      queryParameters: {
        's': search,
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

  Future<Response> getMealsByCategory(String category) async {
    return DioClient.dio.get(
      ApiConfig.filterMealsByCategory,
      queryParameters: {
        'c': category,
      },
    );
  }

  Future<Response> getRandomMeal() async {
    return DioClient.dio.get(
      ApiConfig.randomMeal,
    );
  }
}
