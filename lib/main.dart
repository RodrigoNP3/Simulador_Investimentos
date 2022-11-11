import 'package:flutter/material.dart';
import 'package:simulador/screens/home_screen.dart';
import 'package:simulador/calculadoras/screens/juros_compostos.dart';
import 'package:simulador/calculadoras/screens/juros_simples.dart';
import 'package:simulador/calculadoras/screens/simulador.dart';

import 'calculadoras/screens/conversor_juros.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        Simulador.RouteName: (context) => const Simulador(),
        JurosCompostosScreen.RouteName: (context) =>
            const JurosCompostosScreen(),
        JurosSimplesScreen.RouteName: (context) => const JurosSimplesScreen(),
        ConversorJuros.RouteName: (context) => const ConversorJuros(),
      },
    );
  }
}
