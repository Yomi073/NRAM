import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final int? userId;
  final String? email;
  final String? firstName;
  final String? lastName;
  final List<String>? authorities;

  const LoginResponse({
    this.userId,
    this.email,
    this.firstName,
    this.lastName,
    this.authorities,
  });

  @override
  List<Object?> get props {
    return [
      userId,
      email,
      firstName,
      lastName,
      authorities,
    ];
  }

  factory LoginResponse.fromJson(Map<String, dynamic> map) {
    return LoginResponse(
      userId: map['userId'] ?? "",
      email: map['email'] ?? "",
      firstName: map['firstName'] ?? "",
      lastName: map['lastName'] ?? "",
      authorities: map['authorities'] ?? "",
    );
  }
}
