import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pv_smart_click/features/presentation/widgets/my_button.dart';
import 'package:pv_smart_click/features/presentation/widgets/textfield.dart';
import 'package:pv_smart_click/core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUpUser(BuildContext context) async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final email = usernameController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please fill in all required fields.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 18.0,
      );
      return;
    }

    final isValidEmail = isEmailValid(email);
    if (!isValidEmail) {
      Fluttertoast.showToast(
        msg: "Please enter a valid email address.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 18.0,
      );
      return;
    }

    if (password != confirmPassword) {
      Fluttertoast.showToast(
        msg: "Passwords do not match. Please re-enter your password.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 18.0,
      );
      return;
    }
    final isValidPassword = isPasswordValid(password);

    if (!isValidPassword) {
      Fluttertoast.showToast(
        msg: "Please enter a valid password.\nRequirements: "
            "at least 8 characters, uppercase and lowercase letters, "
            "a number, and a special character.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        fontSize: 18.0,
      );
      return;
    }

    final response = await http.post(
      Uri.parse('$apiBaseURL/users/registration'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password, "firstName": firstName, "lastName": lastName, "registrationType": "PERSONAL"}),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode != 201) {
      Fluttertoast.showToast(
        msg: data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 18.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Registered successfully. Confirmation link has been sent.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 18.0,
      );
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  bool isEmailValid(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
      caseSensitive: false,
    );

    return emailRegExp.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$',
    );

    return passwordRegExp.hasMatch(password);
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
                    'Create account',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 48.0),
                  Text(
                    'Sign up today to unlock a personalized experience tailored just for you!',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 30.0),
                  MyTextField(
                    controller: firstNameController,
                    labelText: 'First name',
                    hintText: 'Enter your first name',
                    obscureText: false,
                  ),
                  const SizedBox(height: 30.0),
                  MyTextField(
                    controller: lastNameController,
                    labelText: 'Last name',
                    hintText: 'Enter your last name',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20.0),
                  MyTextField(
                    controller: usernameController,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20.0),
                  MyTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20.0),
                  MyTextField(
                    controller: confirmPasswordController,
                    labelText: 'Confirm password',
                    hintText: 'Confirm your password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 48.0),
                  MyButton(
                    labelText: "Sign up",
                    onTap: (context) {
                      signUpUser(context);
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
