import 'package:flutter/material.dart';


class AuthTokenProvider extends ChangeNotifier{
  String? _bearerToken;

  String? get bearerToken => _bearerToken;

  void setBearerToken(String? token) {
    _bearerToken = token;
    notifyListeners();
  }
}



