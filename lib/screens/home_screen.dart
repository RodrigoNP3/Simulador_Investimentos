import 'package:flutter/material.dart';
import 'package:simulador/calculadoras/screens/conversor_juros.dart';
import 'package:simulador/calculadoras/screens/juros_compostos.dart';
import 'package:simulador/calculadoras/screens/juros_simples.dart';
import 'package:simulador/calculadoras/screens/simulador.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Simulador.RouteName);
              },
              child: const Text('Simulador'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(JurosCompostosScreen.RouteName);
              },
              child: const Text('Juros Compostos'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(JurosSimplesScreen.RouteName);
              },
              child: const Text('Juros Simples'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ConversorJuros.RouteName);
              },
              child: const Text('Conversor de Juros'),
            ),
          ],
        ),
      ),
    );
  }
}
