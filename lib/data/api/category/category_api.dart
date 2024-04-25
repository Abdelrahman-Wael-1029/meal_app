import 'package:dio/dio.dart';
import '../../../common/networks/dio_client.dart';
import '../../../core/api_config.dart';

class CategoryApi {
  Future<Response> getCategories() async {
    return DioClient.dio.get(
      ApiConfig.listCategories,
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
  
}
