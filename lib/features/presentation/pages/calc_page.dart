import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pv_smart_click/features/presentation/widgets/my_button.dart';

import 'package:http/http.dart' as http;

import '../../data/repository/auth_token_provider.dart';

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


class _CalculatorPageState extends State<CalculatorPage> {
  List<Map<String, dynamic>> fetchedData = [];
  List<String> hrList = [];
  List<String> baList = [];
  String countryCode = "";
  List<String> possibleTariffModels = [''];

  @override
  void initState() {
    super.initState();
    fetchData();
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

        if (result is String) {
          List<dynamic> decodedResult = json.decode(result);

          List<String> namesList = decodedResult.map((item) => item['name'].toString()).toList();
          _results.add({queryParams['country']!: namesList});
        } else {
          print("Unexpected result type: ${result.runtimeType}");
        }

      } catch (e) {
        print('Error fetching supplier: $e');
      }

      setState(() {
        fetchedData = _results;
        hrList = fetchedData
            .where((map) => map.containsKey("HR"))
            .map((map) => map["HR"] as List<String>)
            .fold<List<String>>([], (prev, element) => prev..addAll(element));

        baList = fetchedData
            .where((map) => map.containsKey("BA"))
            .map((map) => map["BA"] as List<String>)
            .fold<List<String>>([], (prev, element) => prev..addAll(element));
      });
    }

    return _results;
  }

  Future<dynamic> fetchGroup(country, name, privacyStatus) async {
    final response = await http
        .get(Uri.parse('https://dev.backend.pvsmartclick.com/price/tariffName').replace(queryParameters: {
      'country': country,
      'name': name,
      'privacyStatus': privacyStatus,
    }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer xxx', // Example: Authorization header with a bearer token
      },
    );

    String jsonString = response.body;
    List<Map<String, dynamic>> jsonList = (json.decode(jsonString) as List<dynamic>).cast<Map<String, dynamic>>();
    List<String> tariffModels = jsonList.map((item) => item['tariffModel'].toString()).toList();
    tariffModels.add('');
    setState(() {
      possibleTariffModels = tariffModels;
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load supplier');
    }
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

  String? selectedTariffGroup = '';


  updateOptionsForThirdDropdown() async {
    await fetchGroup(countryCode, selectedSupplier, "PUBLIC_ALL");
  }
  void updateOptionsForSecondDropdown() {
    if (selectedCountry == 'Croatia') {
      setState(() {
        countryCode = "HR";
        suppliers = [ ...hrList, ''];
      });
    } else if (selectedCountry == 'Bosnia and Herzegovina') {
      setState(() {
        countryCode = "BA";
        suppliers = [...baList, ''];
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
                            item.toString(),
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                      ))
                          .toList(),
                      onChanged: (item) => {
                        setState (() {
                          selectedCountry = item;
                          updateOptionsForSecondDropdown();
                      })
                  }),const SizedBox(height: 30.0),
                  Text(
                    'Supplier',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
              SingleChildScrollView(
                child: DropdownButton(
                      menuMaxHeight: 400,
                      value: selectedSupplier,
                      isExpanded: true,
                      items: suppliers
                          .map((item) => DropdownMenuItem(
                        value: item,
                          child: ListTile(
                            title: Text(
                              item.toString(),
                              style: Theme.of(context).textTheme.displaySmall,
                            )),
                      ))
                          .toList(),
                      onChanged: (item) => setState (() {
                        selectedSupplier = item;
                        updateOptionsForThirdDropdown();
                      })
                  )),
                  const SizedBox(height: 30.0),
                  Text(
                    'Tariff group',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 10.0),
                DropdownButton(
                    menuMaxHeight: 400,
                    value: selectedTariffGroup,
                    isExpanded: true,
                    items: possibleTariffModels
                        .map((item) => DropdownMenuItem(
                      value: item,
                      child: ListTile(
                        title: Text(
                        item.toString(),
                        style: Theme.of(context).textTheme.displaySmall,
                      )),
                    ))
                        .toList(),
                    onChanged: (item) => setState (() {
                      selectedTariffGroup = item;
                    })
                ),
                  const SizedBox(height: 30.0),
                  Text(
                    'Roof Pitch',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 10.0),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 5.0, // Set the height of the track
                  activeTrackColor: Theme.of(context).focusColor, // Set the background color of the slider
                  inactiveTrackColor: Theme.of(context).shadowColor, // Set the color of the inactive portion of the slider
                  thumbColor: Theme.of(context).hintColor, // Set the color of the thumb
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 9.0), // Set the shape of the thumb
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0), // Set the shape of the overlay
                ),
                  child: Slider(
                    value: _currentSliderValue,
                    max: 180,
                    divisions: 180,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  )),
                  const SizedBox(height: 30.0),
                  Text(
                    'Orientation',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 10.0),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 5.0, // Set the height of the track
                  activeTrackColor: Theme.of(context).focusColor, // Set the background color of the slider
                  inactiveTrackColor: Theme.of(context).shadowColor, // Set the color of the inactive portion of the slider
                  thumbColor: Theme.of(context).hintColor, // Set the color of the thumb
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 9.0), // Set the shape of the thumb
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0), // Set the shape of the overlay
                ),
                child: Slider(
                    value: _currentSliderValueOrientation,
                    max: orientationLabels.length.toDouble() - 1, // Adjust the maximum value based on the number of labels
                    divisions: orientationLabels.length - 1,
                    label: _getCurrentOrientationLabel(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValueOrientation = value;
                      });
                    },
                  )),
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
