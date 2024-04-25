import 'package:dio/dio.dart';
import '../../core/api_config.dart';

class DioClient {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        receiveDataWhenStatusError: true,
        headers: ApiConfig.headers,
      ),
    );
  }
}
