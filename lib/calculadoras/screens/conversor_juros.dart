import 'dart:math';

import 'package:flutter/material.dart';

class ConversorJuros extends StatefulWidget {
  static const RouteName = '/conversor-juros';

  const ConversorJuros({Key? key}) : super(key: key);

  @override
  _ConversorJurosState createState() => _ConversorJurosState();
}

class _ConversorJurosState extends State<ConversorJuros> {
  TextEditingController taxaController = TextEditingController();
  String _dropDownValue = 'Mensal';

  final List<String> list = [
    'Diario',
    'Mensal',
    'Trimestral',
    'Semestral',
    'Anual',
  ];

  double diario = 0;
  double mensal = 0;
  double trimestral = 0;
  double semestral = 0;
  double anual = 0;

  void clearValues() {
    diario = 0;
    mensal = 0;
    trimestral = 0;
    semestral = 0;
    anual = 0;
  }

  void diarioMensal() {
    double asd = (pow((1 + diario), 365) - 1).toDouble();
    mensal = (pow(1 + asd, 1 / 12) - 1).toDouble();
    if (trimestral == 0) mensalTrimestral();
  }

  void mensalTrimestral() {
    trimestral = (pow((1 + mensal), 3) - 1).toDouble();
    if (semestral == 0) trimestralSemestral();
  }

  void trimestralSemestral() {
    semestral = (pow((1 + trimestral), 2) - 1).toDouble();
    if (anual == 0) semestralAnual();
  }

  void semestralAnual() {
    anual = (pow((1 + semestral), 2) - 1).toDouble();
    if (diario == 0) anualDiario();
  }

  void anualDiario() {
    diario = (pow(1 + anual, 1 / 365) - 1).toDouble();
    diarioMensal();
  }

  void conversor() {
    clearValues();
    if (taxaController == null) {
      return;
    }
    switch (_dropDownValue) {
      case 'Diario':
        diario = double.parse(taxaController.text) / 100;
        diarioMensal();
        break;
      case 'Mensal':
        print('_dropDownValue');
        mensal = double.parse(taxaController.text) / 100;
        mensalTrimestral();
        break;
      case 'Trimestral':
        trimestral = double.parse(taxaController.text) / 100;
        trimestralSemestral();
        break;
      case 'Semestral':
        semestral = double.parse(taxaController.text) / 100;
        semestralAnual();
        break;
      case 'Anual':
        anual = double.parse(taxaController.text) / 100;
        anualDiario();
        break;
      default:
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Juros'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 250,
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: 'Taxa'),
                    controller: taxaController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      conversor();
                    },
                  ),
                ),
                DropdownButton(
                  value: _dropDownValue,
                  onChanged: (String? value) {
                    setState(() {
                      _dropDownValue = value!;
                      conversor();
                    });
                  },
                  items: list
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),

            Container(
              width: double.infinity,
              height: 350,
              child: ListWheelScrollView(
                onSelectedItemChanged: (value) => print(value),
                squeeze: 1,
                perspective: 0.01, // useMagnifier: true,
                // magnification: 1,
                diameterRatio: 2,
                itemExtent: 80,

                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text(
                            'Diario: ${(diario * 100).toStringAsFixed(2)}%'),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text(
                            'Mensal: ${(mensal * 100).toStringAsFixed(2)}%'),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text(
                            'Trimestral: ${(trimestral * 100).toStringAsFixed(2)}%'),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text(
                            'Semestral: ${(semestral * 100).toStringAsFixed(2)}%'),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child:
                            Text('Anual: ${(anual * 100).toStringAsFixed(2)}%'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   color: Colors.red,
            //   child: Column(
            //     children: [
            //       Container(
            //         width: double.infinity,
            //         height: 50,
            //         child: Card(
            //           elevation: 5,
            //           child: Center(
            //             child: Text(
            //                 'Diario: ${(diario * 100).toStringAsFixed(2)}%'),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         width: double.infinity,
            //         height: 50,
            //         child: Card(
            //           elevation: 5,
            //           child: Center(
            //             child: Text(
            //                 'Mensal: ${(mensal * 100).toStringAsFixed(2)}%'),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         width: double.infinity,
            //         height: 50,
            //         child: Card(
            //           elevation: 5,
            //           child: Center(
            //             child: Text(
            //                 'Trimestral: ${(trimestral * 100).toStringAsFixed(2)}%'),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         width: double.infinity,
            //         height: 50,
            //         child: Card(
            //           elevation: 5,
            //           child: Center(
            //             child: Text(
            //                 'Semestral: ${(semestral * 100).toStringAsFixed(2)}%'),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         width: double.infinity,
            //         height: 50,
            //         child: Card(
            //           elevation: 5,
            //           child: Center(
            //             child:
            //                 Text('Anual: ${(anual * 100).toStringAsFixed(2)}%'),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
