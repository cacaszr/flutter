import 'package:dio/dio.dart';
import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_application_1/models/login_request_model.dart';
import 'package:flutter_application_1/models/login_response_model.dart';

class ApiService {
  final baseURL = AppConstants.baseUrl;
  final dio = Dio();

  Future<LoginResponseModel> login(LoginRequestModel requestBody) async {
    final response = await dio.post(
      '$baseURL/auth/login',
      data: requestBody.toJson(),
    );
    return LoginResponseModel.fromJson(response.data);
  }
}