import 'package:flutter/material.dart';

class JurosSimplesScreen extends StatefulWidget {
  static const RouteName = '/juros-simples';

  const JurosSimplesScreen({Key? key}) : super(key: key);

  @override
  _JurosSimplesScreenState createState() => _JurosSimplesScreenState();
}

class _JurosSimplesScreenState extends State<JurosSimplesScreen> {
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
      var nPeriodos = int.parse(periodos.text) / 100;

      setState(() {
        resultado = initial + (initial * taxaMensal * nPeriodos);
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
              child: Text('Juros Simples'),
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
