import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pv_smart_click/features/data/repository/auth_token_provider.dart';
import 'package:pv_smart_click/features/presentation/widgets/my_button.dart';
import 'package:pv_smart_click/core/constants/constants.dart';

import 'package:http/http.dart' as http;

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

//mijokozina@gmail.com
//PVSmartClick1

class _CalculatorPageState extends State<CalculatorPage> {
  String? bearerToken;
  List<Map<String, dynamic>> fetchedData = [];
  final country = TextEditingController();
  final supplier = TextEditingController();
  final tariffGroup = TextEditingController();
  final roofSlope = TextEditingController();
  final azimuth = TextEditingController();
  final area = TextEditingController();
  final consumption = TextEditingController();
  List<String> countries = [
    'Croatia',
    'Bosnia and Herzegovina',
  ];
  List<String> suppliers = [
    '',
  ];
  List<String> tariffGroups = [
    '',
  ];
  String? countryCode = 'HR';
  String? selectedCountry = 'Croatia';
  String? selectedSupplier = '';
  String? selectedTariffGroup = '';

  @override
  void initState() {
    super.initState();
    final authTokenProvider = Provider.of<AuthTokenProvider>(context, listen: false);
    bearerToken = authTokenProvider.bearerToken;
    countriesDropdownUpdate();
  }

  Future<List<String>> fetchSuppliers(countryCode, bearerToken) async {
    final response = await http.get(
      Uri.parse('$apiBaseURL/price/supplierName').replace(queryParameters: {
        'country': countryCode,
        'privacyStatus': 'PUBLIC_BASIC',
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': bearerToken,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => item['name'].toString()).toList();
    } else {
      Fluttertoast.showToast(
        msg: "Could not fetch suppliers",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 18.0,
      );
      return [''];
    }
  }

  Future<List<String>> fetchTariffGroup(supplierName, bearerToken) async {
    final response = await http.get(
      Uri.parse('$apiBaseURL/price/tariffName').replace(queryParameters: {
        'country': countryCode,
        'name': supplierName,
        'privacyStatus': 'PUBLIC_BASIC',
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': bearerToken,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => item['tariffModel'].toString()).toList();
    } else {
      Fluttertoast.showToast(
        msg: "Could not fetch suppliers",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 18.0,
      );
      return [''];
    }
  }

  void countriesDropdownUpdate() async {
    if (selectedCountry == 'Croatia') {
      countryCode = "HR";
    } else if (selectedCountry == 'Bosnia and Herzegovina') {
      countryCode = "BA";
    } else {
      setState(() {
        suppliers = [''];
      });
    }
    List<String> tempSuppliers = await fetchSuppliers(countryCode, bearerToken);
    setState(() {
      suppliers = tempSuppliers;
      if (suppliers.isNotEmpty) {
        selectedSupplier = suppliers.contains(selectedSupplier) ? selectedSupplier : suppliers.first;
      } else {
        selectedSupplier = '';
      }
    });
    supplierDropdownUpdate();
  }

  void supplierDropdownUpdate() async {
    List<String> tempTariffGroups = await fetchTariffGroup(selectedSupplier, bearerToken);
    setState(() {
      tariffGroups = tempTariffGroups;
      if (tariffGroups.isNotEmpty) {
        selectedTariffGroup = tariffGroups.contains(selectedTariffGroup) ? selectedTariffGroup : tariffGroups.first;
      } else {
        selectedTariffGroup = '';
      }
    });
  }

  double _currentSliderValue = 20;

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

  void calculate(BuildContext context) {
    print(bearerToken);
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
                            setState(() {
                              selectedCountry = item;
                              countriesDropdownUpdate();
                            })
                          }),
                  const SizedBox(height: 30.0),
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
                                    child: Text(
                                      item.toString(),
                                      style: Theme.of(context).textTheme.displaySmall,
                                    ),
                                  ))
                              .toList(),
                          onChanged: (item) => setState(() {
                                selectedSupplier = item;
                                supplierDropdownUpdate();
                              }))),
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
                      items: tariffGroups
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item.toString(),
                                  style: Theme.of(context).textTheme.displaySmall,
                                ),
                              ))
                          .toList(),
                      onChanged: (item) => setState(() {
                            selectedTariffGroup = item;
                          })),
                  const SizedBox(height: 30.0),
                  Text(
                    'Roof Pitch',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 10.0),
                  SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 5.0,
                        // Set the height of the track
                        activeTrackColor: Theme.of(context).focusColor,
                        // Set the background color of the slider
                        inactiveTrackColor: Theme.of(context).shadowColor,
                        // Set the color of the inactive portion of the slider
                        thumbColor: Theme.of(context).hintColor,
                        // Set the color of the thumb
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 9.0),
                        // Set the shape of the thumb
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
                        trackHeight: 5.0,
                        // Set the height of the track
                        activeTrackColor: Theme.of(context).focusColor,
                        // Set the background color of the slider
                        inactiveTrackColor: Theme.of(context).shadowColor,
                        // Set the color of the inactive portion of the slider
                        thumbColor: Theme.of(context).hintColor,
                        // Set the color of the thumb
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 9.0),
                        // Set the shape of the thumb
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0), // Set the shape of the overlay
                      ),
                      child: Slider(
                        value: _currentSliderValueOrientation,
                        max: orientationLabels.length.toDouble() - 1,
                        // Adjust the maximum value based on the number of labels
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
                  TextField(
                    controller: area,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$'))],
                    decoration: const InputDecoration(
                      labelText: 'Consumption',
                      hintText: 'Enter the average monthly consumption in EUR',
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
