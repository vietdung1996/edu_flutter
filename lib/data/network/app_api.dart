import 'package:lecture_4/app/Constants.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
}
