import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable {
  final String? email;
  final String? password;

  const LoginRequest({
    this.email,
    this.password,
  });

  @override
  List<Object?> get props {
    return [
      email,
      password,
    ];
  }

  factory LoginRequest.fromJson(Map<String, dynamic> map) {
    return LoginRequest(
      email: map['email'] ?? "",
      password: map['password'] ?? "",
    );
  }
}
