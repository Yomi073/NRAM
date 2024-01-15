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
                    'Dobrodošli natrag!',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 48.0),
                  MyTextField(
                    controller: usernameController,
                    labelText: 'E-mail:',
                    hintText: 'Upiši e-mail',
                    obscureText: false,
                  ),
                  const SizedBox(height: 24.0),
                  MyTextField(
                    controller: passwordController,
                    labelText: 'Lozinka:',
                    hintText: 'Upiši svoju lozinku',
                    obscureText: true,
                  ),
                  const SizedBox(height: 48.0),
                  MyButton(
                    labelText: "PRIJAVI SE",
                    onTap: (context) {
                      signUpUser(context);
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Još nemaš račun? Registriraj se ovdje',
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
