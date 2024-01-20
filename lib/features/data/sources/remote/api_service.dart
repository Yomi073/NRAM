import 'package:dio/dio.dart';
import 'package:pv_smart_click/core/constants/constants.dart';
import 'package:pv_smart_click/features/domain/entities/login_request.dart';
import 'package:pv_smart_click/features/domain/entities/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: APIBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST('/auth/login')
  Future<HttpResponse<LoginResponse>> postLogin({
    @Body() LoginRequest? loginRequest,
  });
}