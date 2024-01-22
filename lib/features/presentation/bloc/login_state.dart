part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final LoginResponse? loginResponse;
  final DioException? exception;

  const LoginState({this.loginResponse, this.exception});

  @override
  List<Object> get props => [loginResponse!, exception!];
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginDone extends LoginState {
  const LoginDone(LoginResponse loginResponse)
      : super(loginResponse: loginResponse);
}

class LoginError extends LoginState {
  const LoginError(DioException exception) : super(exception: exception);
}
