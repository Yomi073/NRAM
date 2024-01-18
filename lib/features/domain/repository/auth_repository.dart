import 'package:pv_smart_click/features/domain/entities/login_request.dart';
import 'package:pv_smart_click/features/domain/entities/login_response.dart';

import '../../../core/resources/data_state.dart';

abstract class AuthRepository {
  // API methods
  Future<DataState<LoginResponse>> postLogin(LoginRequest loginRequest);
}
