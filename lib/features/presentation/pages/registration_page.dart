import 'package:flutter/material.dart';
import 'package:pv_smart_click/features/presentation/pages/login_page.dart';
import 'package:pv_smart_click/features/presentation/widgets/my_button.dart';
import 'package:pv_smart_click/features/presentation/widgets/textfield.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signInUser(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
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
                    controller: nameController,
                    labelText: 'Name',
                    hintText: 'Enter your name',
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
                      signInUser(context);
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
