import 'package:flutter/material.dart';

class BienvenidaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Cambia el color de fondo según tus preferencias
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenido!',
              style: TextStyle(
                fontSize: 50.0, // Tamaño de fuente grande
                fontWeight: FontWeight.bold, // Negrita
                color: Color.fromARGB(255, 211, 39, 27), // Color de texto
              ),
            ),
            SizedBox(height: 40.0), // Espacio entre el título y la imagen
            Image.asset(
              'assets/images/logo.png', // Ruta de la imagen desde la carpeta assets
              width: 300, // Ajusta el ancho de la imagen según tus necesidades
            ),
            SizedBox(height: 80.0), // Espacio entre la imagen y el botón
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cajero');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .teal, // Cambia el color de fondo según tus preferencias
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30.0), // Ajusta el valor para hacer el botón más redondeado
                ),
              ),
              child: Container(
                width: 300.0, // Ajusta el ancho del botón según tus necesidades
                height:
                    70.0, // Ajusta la altura del botón según tus necesidades // Para que el botón ocupe todo el ancho disponible
                padding: EdgeInsets.all(
                    15.0), // Ajusta el espacio interior del botón
                alignment: Alignment.center, // Centra el texto verticalmente
                child: Text(
                  'Continuar',
                  style: TextStyle(
                    fontSize: 30.0, // Ajusta el tamaño de fuente del botón
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
