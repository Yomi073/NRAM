part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class PostLogin extends LoginEvent {
  const PostLogin();
}
