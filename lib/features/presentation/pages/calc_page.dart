import 'package:flutter/material.dart';
import 'package:pv_smart_click/features/presentation/widgets/my_button.dart';
import 'package:pv_smart_click/features/presentation/widgets/textfield.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final country = TextEditingController();
  final supplier = TextEditingController();
  final tariffGroup = TextEditingController();

  //final productionType = TextEditingController();
  final roofSlope = TextEditingController();
  final azimuth = TextEditingController();
  final area = TextEditingController();

  void calculate(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/result');
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
                    'Osnovni kalkulator',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 30.0),
                  MyTextField(
                    controller: country,
                    labelText: 'Država:',
                    hintText: 'Odaberite državu',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20.0),
                  MyTextField(
                    controller: supplier,
                    labelText: 'Dobavljač:',
                    hintText: 'Odaberite dobavljača',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20.0),
                  MyTextField(
                    controller: tariffGroup,
                    labelText: 'Tarifna grupa:',
                    hintText: 'Odaberite tarifnu grupu',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20.0),
                  /*
                  MyTextField(
                    controller: productionType,
                    labelText: 'Način proračuna proizvodnje:',
                    hintText: 'PVGIS',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20.0),
                  */
                  MyTextField(
                    controller: roofSlope,
                    labelText: 'Nagib krova:',
                    hintText: 'Upišite nagib krova',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20.0),
                  MyTextField(
                    controller: azimuth,
                    labelText: 'Orijentacija:',
                    hintText: 'Upišite orijentaciju',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20.0),
                  MyTextField(
                    controller: area,
                    labelText: 'Površina:',
                    hintText: 'Upišite površinu krova',
                    obscureText: false,
                  ),
                  const SizedBox(height: 48.0),
                  MyButton(
                    labelText: "Izračunaj",
                    onTap: (context) {
                      calculate(context);
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
