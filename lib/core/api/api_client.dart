import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_config.dart';

class ApiClient{
  Dio getDio(){
    Dio dio = Dio();
    dio.options.baseUrl = ApiConfig.dioUrl;

    dio.interceptors.add(PrettyDioLogger(
      responseHeader: true,
      responseBody: true,
      requestHeader: true,
      requestBody: true,
      request: true,
      compact: true,
    ));

    return dio;
  } 
}