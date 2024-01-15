import 'package:flutter/material.dart';
import 'package:pv_smart_click/config/theme/app_themes.dart';
import 'package:pv_smart_click/features/presentation/widgets/my_button.dart';
import 'package:pv_smart_click/features/presentation/widgets/textfield.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  void back(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/calculator');
  }

  @override
  Widget build(BuildContext context) {
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
                          '84%',
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
                          '6.31 kW',
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
                          '31.54 m2',
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
                            '9,434.41 kWh',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '1,550.36 kWh',
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
                            '1,200 EUR',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '176.82 EUR',
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
                            '85.26 %',
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
                            '4,231.05 kg',
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
                          '5,046.64 EUR',
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
                          '4.93',
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
                          '23,685.91',
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
