import 'package:flutter_application_1/models/login_request_model.dart';
import 'package:flutter_application_1/models/login_response_model.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:fpdart/fpdart.dart';

class LoginRepository {
  final apiService = ApiService();

  Future<Either<String, LoginResponseModel>> login(
    LoginRequestModel requestBody,
  ) async {
    try {
      final result = await apiService.login(requestBody);
      return Right(result);
    } catch (e) {
      return Left('Login failed');
    }
  }
}