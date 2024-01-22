import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pv_smart_click/features/data/repository/auth_token_provider.dart';
import 'package:pv_smart_click/features/domain/entities/analysis_request.dart';
import 'package:pv_smart_click/features/domain/entities/googleLatLng.dart';
import 'package:pv_smart_click/features/domain/entities/tariff_response.dart';
import 'package:pv_smart_click/features/presentation/widgets/my_button.dart';
import 'package:pv_smart_click/core/constants/constants.dart';

import 'package:http/http.dart' as http;

import '../../domain/entities/analysis_response.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String? bearerToken;
  List<Map<String, dynamic>> fetchedData = [];
  TextEditingController area = TextEditingController();
  TextEditingController consumption = TextEditingController();
  List<String> countries = [
    'Croatia',
    'Bosnia and Herzegovina',
  ];
  List<String?> suppliers = [
    '',
  ];
  List<String> tariffGroups = [
    '',
  ];
  String? countryCode = 'HR';
  String? selectedCountry = 'Croatia';
  String? selectedSupplier = '';
  List<TariffModel> tempTariffModels = [];
  String? selectedTariffGroup = '';
  String? priceID = '';

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

  Future<List<TariffModel>> fetchTariffGroup(supplierName, bearerToken) async {
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
      tempTariffModels = jsonResponse.map<TariffModel>((item) => TariffModel.fromJson(item)).toList();
      return tempTariffModels;
    } else {
      Fluttertoast.showToast(
        msg: "Could not fetch suppliers",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 18.0,
      );
      return [];
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
    List<TariffModel> tempTariffGroups = await fetchTariffGroup(selectedSupplier, bearerToken);
    setState(() {
      tariffGroups = tempTariffGroups.map((tariffModel) {
        return tariffModel.tariffModel ?? '';
      }).toList();
      if (tariffGroups.isNotEmpty) {
        selectedTariffGroup = tariffGroups.contains(selectedTariffGroup) ? selectedTariffGroup : tariffGroups.first;
      } else {
        selectedTariffGroup = '';
      }
    });
    tariffDropdownUpdate();
  }

  void tariffDropdownUpdate() {
    TariffModel selectedTariff = tempTariffModels.firstWhere(
      (tariff) => tariff.tariffModel == selectedTariffGroup,
      orElse: () => throw Exception('Tariff model not found'),
    );
    setState(() {
      priceID = selectedTariff.priceId;
    });
  }

  double _roofAngleSlider = 20;

  double _roofOrientationSlider = 0;

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

  String getCurrentOrientationLabel() {
    int index = _roofOrientationSlider.round();
    return orientationLabels[index];
  }

  Future<void> calculate(BuildContext context, String bearerToken) async {
    if ((selectedCountry?.isEmpty ?? true) || (selectedSupplier?.isEmpty ?? true) || (selectedTariffGroup?.isEmpty ?? true) || (area.text.isEmpty) || (consumption.text.isEmpty)) {
      Fluttertoast.showToast(
        msg: "Please fill all fields",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 18.0,
      );
    } else {
      GoogleLatLng googleLatLng = GoogleLatLng(
        lat: '43.1783936',
        lng: '17.5439872',
      );
      AnalysisRequest analysisRequest = AnalysisRequest(
        tilt: _roofAngleSlider.toString(),
        area: area.text,
        azimuth: (_roofOrientationSlider * 45).toString(),
        consumptionAverageBill: consumption.text,
        googleLatLng: googleLatLng,
        priceID: priceID.toString(),
        siteDataInputType: "PVGIS",
        typeCalculation: "${countryCode!}_FEED_IN_NET",
      );

      var jsonBody = jsonEncode(analysisRequest.toJson());

      final response = await http.post(
        Uri.parse('$apiBaseURL/analysis/basic/pvgis/monthly'),
        headers: {'Content-Type': 'application/json', 'X-API-authentication-token': bearerToken},
        body: jsonBody,
      );
      AnalysisResponse? analysisResponse;
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        analysisResponse = AnalysisResponse.fromJson(jsonMap);
      } else {
        Fluttertoast.showToast(
          msg: response.body,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 18.0,
        );
      }

      Navigator.pushNamed(
        context,
        '/result',
        arguments: analysisResponse,
      );
    }
  }

  String doubleToSting(double value) {
    return value.toStringAsFixed(2);
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
                    'Calculator',
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
                            tariffDropdownUpdate();
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
                        value: _roofAngleSlider,
                        max: 90,
                        divisions: 90,
                        label: _roofAngleSlider.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _roofAngleSlider = value;
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
                        value: _roofOrientationSlider,
                        max: orientationLabels.length.toDouble() - 1,
                        // Adjust the maximum value based on the number of labels
                        divisions: orientationLabels.length - 1,
                        label: getCurrentOrientationLabel(),
                        onChanged: (double value) {
                          setState(() {
                            _roofOrientationSlider = value;
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
                    controller: consumption,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$'))],
                    decoration: const InputDecoration(
                      labelText: 'Consumption',
                      hintText: 'Average monthly consumption in EUR',
                    ),
                    obscureText: false,
                  ),
                  const SizedBox(height: 48.0),
                  MyButton(
                    labelText: "Calculate",
                    onTap: (context) {
                      calculate(context, bearerToken!);
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
