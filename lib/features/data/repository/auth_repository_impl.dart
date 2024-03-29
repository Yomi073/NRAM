import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pv_smart_click/core/resources/data_state.dart';
import 'package:pv_smart_click/features/data/sources/remote/api_service.dart';
import 'package:pv_smart_click/features/domain/entities/login_request.dart';
import 'package:pv_smart_click/features/domain/entities/login_response.dart';
import 'package:pv_smart_click/features/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<DataState<LoginResponse>> postLogin(LoginRequest loginRequest) async {
    try {
      print("MAKING REQUEST TO LOGIN");
      final httpResponse = await _apiService.postLogin(
        loginRequest: loginRequest,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print("LOGIN OK");
        return DataSuccess(httpResponse.data);
      } else {
        print("LOGIN FAILED");
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
