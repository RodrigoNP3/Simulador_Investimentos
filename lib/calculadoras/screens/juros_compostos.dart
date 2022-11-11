import 'package:flutter/material.dart';
import 'dart:math';

class JurosCompostosScreen extends StatefulWidget {
  static const RouteName = '/juros-compostos';

  const JurosCompostosScreen({Key? key}) : super(key: key);

  @override
  _JurosCompostosScreen createState() => _JurosCompostosScreen();
}

class _JurosCompostosScreen extends State<JurosCompostosScreen> {
  TextEditingController initialValue = TextEditingController();
  TextEditingController periodos = TextEditingController();
  TextEditingController taxa = TextEditingController();

  double resultado = 0;

  void result() {
    if (initialValue.text.isNotEmpty &&
        periodos.text.isNotEmpty &&
        taxa.text.isNotEmpty) {
      var initial = double.parse(initialValue.text);
      var taxaMensal = double.parse(taxa.text);
      var nPeriodos = int.parse(periodos.text);

      setState(() {
        resultado = initial * pow((1 + (taxaMensal / 100)), nPeriodos);
      });
    } else {
      resultado = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('R\$ ${resultado.toStringAsFixed(2)}'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Center(
              child: Text('Juros Compostos'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Montante Inicial'),
              controller: initialValue,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                result();
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Taxa'),
              controller: taxa,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                result();
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Periodo'),
              controller: periodos,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                result();
              },
            ),
          ],
        ),
      ),
    );
  }
}
