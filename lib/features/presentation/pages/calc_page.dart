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

  List<String> countries = [
    'Albania',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Croatia',
    'Greece',
    'Kosovo',
    'Montenegro',
    'North Macedonia',
    'Romania',
    'Serbia',
  ];
  String? selectedCountry = 'Croatia';

  double _currentSliderValue = 20;

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
                    'Base calculator',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 30.0),

                  const SizedBox(height: 30.0),
                  Text(
                    'Country',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  DropdownButton(
                      menuMaxHeight: 300,
                      value: selectedCountry,
                      items: countries
                          .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                              item,
                              style: TextStyle(fontSize: 22))
                      ))
                          .toList(),
                      onChanged: (item) => setState(() => selectedCountry = item)
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
                  Text(
                    'Roof Pitch',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 10.0),
                  Slider(
                    value: _currentSliderValue,
                    max: 180,
                    divisions: 180,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
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
