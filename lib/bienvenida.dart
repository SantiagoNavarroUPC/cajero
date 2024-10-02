import 'package:flutter/material.dart';

class BienvenidaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenido!',
              style: TextStyle(
                fontSize: 50.0, // Tamaño de fuente grande
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 211, 39, 27), // Color de texto
              ),
            ),
            SizedBox(height: 40.0),
            Image.asset(
              'assets/images/logo.png',
              width: 300,
            ),
            SizedBox(height: 80.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cajero');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .teal, // Cambia el color de fondo según tus preferencias
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30.0),
                ),
              ),
              child: Container(
                width: 300.0,
                height:
                    70.0,
                padding: EdgeInsets.all(
                    15.0),
                alignment: Alignment.center,
                child: Text(
                  'Continuar',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
