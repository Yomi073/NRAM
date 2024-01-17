import 'package:flutter/material.dart';
import 'package:pv_smart_click/features/presentation/widgets/my_button.dart';
import 'package:pv_smart_click/features/presentation/widgets/textfield.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUpUser(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
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
                      signUpUser(context);
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
