import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pv_smart_click/features/data/repository/auth_token_provider.dart';
import 'package:pv_smart_click/features/domain/entities/analysis_response.dart';

class ResultPage extends StatefulWidget {
  final AnalysisResponse? analysisResponse;

  ResultPage({Key? key, this.analysisResponse}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? bearerToken;
  String tilt = "";
  String area = "";
  String azimuth = "";
  String consumptionAverageBill = "";
  String googleLatLng = "";
  String priceID = "";
  String siteDataInputType = "";
  String typeCalculation = "";
  AnalysisResponse? analysisResponse;
  Map<String, String>? parameters;

  @override
  void initState() {
    super.initState();
    final authTokenProvider = Provider.of<AuthTokenProvider>(context, listen: false);
    bearerToken = authTokenProvider.bearerToken;
  }

  @override
  Widget build(BuildContext context) {
    AnalysisResponse? analysisResponse = widget.analysisResponse;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 24.0),
                  Text(
                    'Solarna procjena',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Divider(
                    height: 25,
                    thickness: 3,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Theme.of(context).colorScheme.secondary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Samoopskrba',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          analysisResponse?.selfSufficiencyPercentage as String,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Theme.of(context).colorScheme.onSecondary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DC snaga elektrane',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          '${analysisResponse?.systemCapacity as String} kW',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Theme.of(context).colorScheme.secondary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Površina krova',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          '${analysisResponse?.area as String} m2',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    'Godišnji proračun',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Divider(
                    height: 20,
                    thickness: 3,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    color: Theme.of(context).colorScheme.onSecondary,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            ' ',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Prije Solara',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Poslije solara',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Theme.of(context).colorScheme.secondary,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Potrošnja',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${analysisResponse?.annualConsumptionKWh as String} kWh',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${analysisResponse?.annualReductionConsumptionKWh as String} kWh',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                    color: Theme.of(context).colorScheme.onSecondary,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Račun za energiju',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${analysisResponse?.annualConsumptionMoney as String} EUR',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${analysisResponse?.annualReductionConsumptionMoney as String}  EUR',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                    color: Theme.of(context).colorScheme.secondary,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Redukcija računa',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '0 %',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${analysisResponse?.annualReductionConsumptionPercentage as String}  %',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                    color: Theme.of(context).colorScheme.onSecondary,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Smanjenje CO2',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '0 kg',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${analysisResponse?.annualCO2Reduction as String} kg',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 20,
                    thickness: 3,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Text(
                    'Investicija',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Divider(
                    height: 20,
                    thickness: 3,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Theme.of(context).colorScheme.secondary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Procjena investicije',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          '${analysisResponse?.investment as String} EUR',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Theme.of(context).colorScheme.onSecondary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Povrat investicije (ROI)',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          analysisResponse?.investmentReturn as String,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Theme.of(context).colorScheme.secondary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cjeloživotna ušteda',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          '${analysisResponse?.lifeSavings as String} EUR',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
