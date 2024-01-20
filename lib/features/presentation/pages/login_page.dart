import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:pv_smart_click/features/presentation/widgets/my_button.dart';
import 'package:pv_smart_click/features/presentation/widgets/textfield.dart';

import 'package:http/http.dart' as http;

import '../../data/repository/auth_token_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signInUser(BuildContext context) async {
    final response = await http.post(
      Uri.parse('https://dev.backend.pvsmartclick.com/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': usernameController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      var jwt = response.headers['x-api-authentication-token'];
      final authTokenProvider =
          Provider.of<AuthTokenProvider>(context, listen: false);
      authTokenProvider.setBearerToken(jwt);
      Navigator.pushNamed(context, '/calculator');
    } else if (response.statusCode == 400) {
      Fluttertoast.showToast(
          msg: "Wrong credentials",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.black,
          fontSize: 18.0);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 48.0),
                  Text(
                    'Welcome back!',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 48.0),
                  MyTextField(
                    controller: usernameController,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 24.0),
                  MyTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 48.0),
                  MyButton(
                    labelText: "Login",
                    onTap: (context) {
                      signInUser(context);
                    },
                  ),
                  TextButton(
                    child: Text(
                      "Don't have an account? Sign up!",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                  ),
                  const SizedBox(height: 48.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
