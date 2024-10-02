import 'package:cajero/bienvenida.dart';
import 'package:cajero/cajeroScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cajero App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:
          '/bienvenida',
      routes: {
        '/bienvenida': (context) =>
            BienvenidaScreen(),
        '/cajero': (context) => CajeroScreen(), // Ruta de CajeroScreen
      },
    );
  }
}
