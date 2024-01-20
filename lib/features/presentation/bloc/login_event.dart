part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  final LoginRequest? loginRequest;

  const LoginEvent({this.loginRequest});

  @override
  List<Object> get props => [loginRequest!];
}

class PostLogin extends LoginEvent {
  const PostLogin();
}
