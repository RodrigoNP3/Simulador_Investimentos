import 'dart:math';

import 'package:flutter/material.dart';

class Simulador extends StatefulWidget {
  static const RouteName = '/simulador';
  const Simulador({Key? key}) : super(key: key);

  @override
  _SimuladorState createState() => _SimuladorState();
}

class _SimuladorState extends State<Simulador> {
  TextEditingController initialValue = TextEditingController();
  TextEditingController aportePeriodo = TextEditingController();
  TextEditingController periodos = TextEditingController();
  TextEditingController taxa = TextEditingController();

  List goals = [];
  final String imageUrl =
      'https://static.vecteezy.com/system/resources/previews/001/188/960/non_2x/fireworks-png.png';
  double resultado = 0;

  void result() {
    magicNumber();
    if (initialValue.text.isNotEmpty &&
        periodos.text.isNotEmpty &&
        taxa.text.isNotEmpty &&
        aportePeriodo.text.isNotEmpty) {
      //
      var initial = double.parse(initialValue.text);
      var taxaMensal = (double.parse(taxa.text) / 100);
      var nPeriodos = int.parse(periodos.text);
      var aporte = double.parse(aportePeriodo.text);

      if (aporte > 0) {
        resultado =
            (aporte * (pow((1 + taxaMensal), nPeriodos) - 1)) / taxaMensal;
        resultado =
            resultado + (initial * (pow((1 + taxaMensal), nPeriodos) - 1));
      } else {
        resultado = (initial * (pow((1 + taxaMensal), nPeriodos)));
      }
    } else {
      resultado = 0;
    }
    setState(() {});
  }

  void magicNumber() {
    goals = [];
    if (initialValue.text.isNotEmpty &&
        periodos.text.isNotEmpty &&
        taxa.text.isNotEmpty &&
        aportePeriodo.text.isNotEmpty) {
      //
      var initial = double.parse(initialValue.text);
      var taxaMensal = (double.parse(taxa.text) / 100);
      var nPeriodos = int.parse(periodos.text);
      var aporte = double.parse(aportePeriodo.text);

      resultado = (aporte * (pow((1 + taxaMensal), 1) - 1)) / taxaMensal;

      resultado = resultado + (initial * (pow((1 + taxaMensal), 1) - 1));

      int magicNumberN = 0;

      for (var i = 0; resultado < 11000000; i++) {
        resultado = (aporte * (pow((1 + taxaMensal), i) - 1)) / taxaMensal;

        resultado = resultado + (initial * (pow((1 + taxaMensal), i) - 1));
        magicNumberN = i;

        if (resultado > 10000 && goals.length < 1) {
          goals.add([resultado, i]);
        }
        if (resultado > 50000 && goals.length < 2) {
          goals.add([resultado, i]);
        }

        if (resultado > 100000 && goals.length < 3) {
          goals.add([resultado, i]);
        }
        if (resultado > 200000 && goals.length < 4) {
          goals.add([resultado, i]);
        }
        if (resultado > 500000 && goals.length < 5) {
          goals.add([resultado, i]);
        }
        if (resultado > 1000000 && goals.length < 6) {
          goals.add([resultado, i]);
        }
        if (resultado > 2000000 && goals.length < 7) {
          goals.add([resultado, i]);
        }
        if (resultado > 5000000 && goals.length < 8) {
          goals.add([resultado, i]);
        }
        if (resultado > 10000000 && goals.length < 9) {
          goals.add([resultado, i]);
        }
      }

      print(magicNumberN);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('R\$ ${resultado.toStringAsFixed(2)} '),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.save_rounded)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.folder_special_rounded)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Center(
              child: Text('Simulador de Investimentos'),
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
              decoration: const InputDecoration(hintText: 'Aporte por período'),
              controller: aportePeriodo,
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
            const Divider(),
            goals.isNotEmpty
                ? Expanded(
                    // width: double.infinity,
                    // height: 350,
                    child: ListView.builder(
                      itemCount: goals.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(imageUrl),
                            radius: 24,
                          ),
                          title:
                              Text('R\$ ${goals[index][0].toStringAsFixed(2)}'),
                          subtitle: Text(
                              'Meses: ${goals[index][1]} Anos: ${int.parse((goals[index][1] / 12).toStringAsFixed(0))}'),
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
