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
                    'Registriraj se!',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 30.0),
                  MyTextField(
                    controller: nameController,
                    labelText: 'Ime:',
                    hintText: 'Upiši svoje ime',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20.0),
                  MyTextField(
                    controller: usernameController,
                    labelText: 'E-mail:',
                    hintText: 'Upiši e-mail',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20.0),
                  MyTextField(
                    controller: passwordController,
                    labelText: 'Lozinka:',
                    hintText: 'Upiši svoju lozinku',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20.0),
                  MyTextField(
                    controller: confirmPasswordController,
                    labelText: 'Potvrdi lozinku:',
                    hintText: 'Potvrdi svoju lozinku',
                    obscureText: true,
                  ),
                  const SizedBox(height: 48.0),
                  MyButton(
                    labelText: "REGISTRIRAJ SE",
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
