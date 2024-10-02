import 'package:flutter/material.dart';

class CajeroScreen extends StatefulWidget {
  @override
  _CajeroScreenState createState() => _CajeroScreenState();
}

class _CajeroScreenState extends State<CajeroScreen> {
  final TextEditingController dineroController = TextEditingController();
  int contadorDiez = 0,
      contadorVeinte = 0,
      contadorCincuenta = 0,
      contadorCien = 0,
      contadorColumna = 0,
      descuento = 0;
  int fila = 3;
  bool retiroExitoso = false;

  void realizarRetiro() {
    setState(() {
      int retirarDinero = int.tryParse(dineroController.text) ?? 0;
      FocusScope.of(context).unfocus();
      if ((retirarDinero % 10000 != 0) || (retirarDinero > 1000000)) {
        retiroExitoso = false;
      } else {
        while (descuento < retirarDinero) {
          for (int i = 0; i < 4; i++) {
            if ((i == 0) && (descuento + 10000 <= retirarDinero)) {
              contadorDiez++;
              descuento += 10000;
            }
            if ((i <= 1) && (descuento + 20000 <= retirarDinero)) {
              contadorVeinte++;
              descuento += 20000;
            }
            if ((i <= 2) && (descuento + 50000 <= retirarDinero)) {
              contadorCincuenta++;
              descuento += 50000;
            }
            if ((i <= 3) && (descuento + 100000 <= retirarDinero)) {
              contadorCien++;
              descuento += 100000;
            }
          }

          if (contadorColumna == 3) {
            contadorColumna = 0;
          } else {
            contadorColumna++;
          }
        }
        retiroExitoso = true;
      }
    });
  }

  // Función para manejar la selección de cantidad predeterminada
  void seleccionarCantidad(int cantidad) {
    setState(() {
      dineroController.text = cantidad.toString();
    });
  }

  void reiniciarTransaccion() {
    setState(() {
      FocusScope.of(context).unfocus();
      contadorDiez = 0;
      contadorVeinte = 0;
      contadorCincuenta = 0;
      contadorCien = 0;
      contadorColumna = 0;
      descuento = 0;
      retiroExitoso = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cajero App'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Cuánto dinero desea retirar:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount:
                    [50000, 100000, 200000, 300000, 500000, 1000000].length,
                itemBuilder: (context, index) {
                  final cantidad =
                      [50000, 100000, 200000, 300000, 500000, 1000000][index];
                  return GestureDetector(
                    onTap: () {
                      seleccionarCantidad(cantidad);
                    },
                    child: Container(
                      margin: EdgeInsets.all(
                          5.0), // Agrega espacio adicional de 5 unidades
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                              5.0),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        title: Text(
                          '\$ $cantidad',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors
                                .black,
                          ),
                        ),
                        tileColor:
                            Colors.white,
                        trailing: Icon(
                          Icons.arrow_forward,
                          color: Colors
                              .black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin:
                  EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                      5.0),
                ),
              ),
              width: 400.0,
              height: 60.0,
              child: TextField(
                controller: dineroController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder
                      .none,
                  hintText: 'Ingrese otro valor diferente',
                  contentPadding:
                      EdgeInsets.all(15.0),
                ),
                textAlign: TextAlign
                    .justify,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    realizarRetiro();
                    if (retiroExitoso) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors
                                .white,
                            title: Text('Retiro Exitoso',
                                style: TextStyle(
                                    color: Colors
                                        .teal)),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/images/10k.jpg',
                                    width: 180),
                                Text('Billetes de 10 mil: $contadorDiez'),
                                Image.asset('assets/images/20k.jpg',
                                    width: 180),
                                Text('Billetes de 20 mil: $contadorVeinte'),
                                Image.asset('assets/images/50k.jpg',
                                    width: 180),
                                Text('Billetes de 50 mil: $contadorCincuenta'),
                                Image.asset('assets/images/100k.jpg',
                                    width: 180),
                                Text('Billetes de 100 mil: $contadorCien'),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop();
                                },
                                child: Text(
                                  'Aceptar',
                                  style: TextStyle(
                                      color: Colors
                                          .teal),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors
                                .white,
                            title: Text(
                              'Retiro Fallido.',
                              style: TextStyle(
                                color: Colors
                                    .red,
                              ),
                            ),
                            content: Text(
                                'El retiro no pudo realizarse. Cantidad invalida'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop();
                                },
                                child: Text(
                                  'Aceptar',
                                  style: TextStyle(
                                    color: Colors
                                        .red,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  icon: Icon(Icons.attach_money),
                  label: Text('Realizar Retiro'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.teal),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      dineroController.clear();
                      reiniciarTransaccion();
                    });
                  },
                  icon: Icon(Icons.refresh),
                  label: Text('Limpiar'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
