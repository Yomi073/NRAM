import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pv_smart_click/features/presentation/widgets/my_button.dart';
import 'package:pv_smart_click/features/presentation/widgets/textfield.dart';

import 'package:http/http.dart' as http;

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

Future<dynamic> fetchSupplier(queryParams) async {

  final response = await http
      .get(Uri.parse('https://dev.backend.pvsmartclick.com/price/supplierName').replace(queryParameters: queryParams),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer xxx', // Example: Authorization header with a bearer token
    },
  );

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load supplier');
  }
}


Future<dynamic> fetchData() async {
  final List<Map<String, String>> queryParamsList = [
    {'country': 'HR', 'privacyStatus': 'PUBLIC_ALL'},
    {'country': 'BA', 'privacyStatus': 'PUBLIC_ALL'},
  ];

  List<Map<String, dynamic>> _results = [];

  for (var queryParams in queryParamsList) {
    try {
      dynamic result = await fetchSupplier(queryParams);

      // Parse the JSON string
      List<String> data = jsonDecode(result);

      _results.add({queryParams['country']!: data});

    } catch (e) {
      print('Error fetching supplier: $e');
    }
  }

  print(_results.runtimeType);

  print(_results);
  return _results;
  // [{HR: [{"name":"HEP ELEKTRA"},{"name":"UREDBA VLADE"}]}, {BA: [{"name":"JP Elektroprivreda HZHB"},{"name":"JP Elektroprivreda BIH"},{"name":"JP Elektroprivreda Republike Srpske"}]}


}


class _CalculatorPageState extends State<CalculatorPage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  final country = TextEditingController();
  final supplier = TextEditingController();
  final tariffGroup = TextEditingController();

  //final productionType = TextEditingController();
  final roofSlope = TextEditingController();
  final azimuth = TextEditingController();
  final area = TextEditingController();

  List<String> countries = [
    'Croatia',
    'Bosnia and Herzegovina',
  ];

  String? selectedCountry = 'Croatia';

  List<String> suppliers = [
    '',
  ];

  String? selectedSupplier = '';


  void updateOptionsForSecondDropdown() {
    if (selectedCountry == 'Croatia') {
      setState(() {
        suppliers = ['', 'a A', 'v B', 'c C'];
      });
    } else if (selectedCountry == 'Bosnia and Herzegovina') {
      setState(() {
        suppliers = ['', 'Option A', 'Option B', 'Option C'];
      });
    } else {
      setState(() {
        suppliers = [''];
      });
    }
  }

  double _currentSliderValue = 20;

  void calculate(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/result');
  }

  double _currentSliderValueOrientation = 0;

  // Define orientation labels
  List<String> orientationLabels = [
    'N',
    'NE',
    'E',
    'SE',
    'S',
    'SW',
    'W',
    'NW',
  ];

  String _getCurrentOrientationLabel() {
    int index = _currentSliderValueOrientation.round();
    return orientationLabels[index];
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
                      onChanged: (item) => {
                        setState (() {
                          selectedCountry = item;
                          updateOptionsForSecondDropdown();
                      })
                  }),
                  Text(
                    'Supplier',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  DropdownButton(
                      menuMaxHeight: 300,
                      value: selectedSupplier,
                      items: suppliers
                          .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                              item,
                              style: TextStyle(fontSize: 22))
                      ))
                          .toList(),
                      onChanged: (item) => setState(() => selectedSupplier = item)
                  ),
                  const SizedBox(height: 20.0),
                  MyTextField(
                    controller: tariffGroup,
                    labelText: 'Tariff group',
                    hintText: 'Select a tariff group',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20.0),
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
                  Text(
                    'Orientation',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 10.0),
                  Slider(
                    value: _currentSliderValueOrientation,
                    max: orientationLabels.length.toDouble() - 1, // Adjust the maximum value based on the number of labels
                    divisions: orientationLabels.length - 1,
                    label: _getCurrentOrientationLabel(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValueOrientation = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: area,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$'))],
                    decoration: const InputDecoration(
                      labelText: 'Surface',
                      hintText: 'Enter the area of the roof',
                    ),
                    obscureText: false,
                  ),
                  const SizedBox(height: 48.0),
                  MyButton(
                    labelText: "Calculate",
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
