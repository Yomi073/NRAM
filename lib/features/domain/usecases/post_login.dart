import 'package:pv_smart_click/core/resources/data_state.dart';
import 'package:pv_smart_click/core/usecase/usecase.dart';
import 'package:pv_smart_click/features/domain/entities/login_request.dart';
import 'package:pv_smart_click/features/domain/entities/login_response.dart';
import 'package:pv_smart_click/features/domain/repository/auth_repository.dart';

class PostLoginUseCase implements UseCase<DataState<LoginResponse>, LoginRequest> {
  final AuthRepository _authRepository;

  PostLoginUseCase(this._authRepository);

  @override
  Future<DataState<LoginResponse>> call({LoginRequest? params}) {
    return _authRepository.postLogin(params!);
  }
}
