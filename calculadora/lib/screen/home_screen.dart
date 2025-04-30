import 'package:calculadora/components/buttons_calculadora.dart';
import 'package:calculadora/components/visor.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int valorAtual = 0;
  int valorAnterior = 0;
  String operacao = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 34, 87, 231),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Visor(valorAtual: valorAtual),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonsCalculadora(
                  onButtonPressed: (String valor, String tipo) {
                    switch (tipo) {
                      case "numero":
                        if (valorAtual == 0) {
                          setState(() {
                            valorAtual = int.parse(valor);
                          });
                        } else {
                          String valorConcatenado =
                              valorAtual.toString() + valor.toString();
                          valor = valorConcatenado;
                          setState(() {
                            valorAtual = int.parse(valor);
                          });
                        }

                      case "operacao":
                        if (valor == "x") {
                          setState(() {
                            operacao = valor;
                          });
                          setState(() {
                            valorAnterior = valorAtual;
                            valorAtual = 0;
                          });
                        } else if (valor == "/") {
                          setState(() {
                            operacao = valor;
                          });
                          setState(() {
                            valorAnterior = valorAtual;
                            valorAtual = 0;
                          });
                        } else if (valor == "+") {
                          setState(() {
                            operacao = valor;
                          });
                          setState(() {
                            valorAnterior = valorAtual;
                            valorAtual = 0;
                          });
                        } else if (valor == "-") {
                          setState(() {
                            operacao = valor;
                          });
                          setState(() {
                            valorAnterior = valorAtual;
                            valorAtual = 0;
                          });
                        } else if (valor == "=") {
                          switch (operacao) {
                            case "x":
                              setState(() {
                                valorAtual = valorAnterior * valorAtual;
                              });
                              break;
                            case "/":
                              setState(() {
                                valorAtual =
                                    (valorAnterior / valorAtual).toInt();
                              });
                              break;
                            case "+":
                              setState(() {
                                valorAtual = valorAnterior + valorAtual;
                              });
                              break;
                            case "-":
                              setState(() {
                                valorAtual = valorAnterior - valorAtual;
                              });
                              break;
                          }
                        } else if (valor == "C") {
                          setState(() {
                            valorAtual = 0;
                            valorAnterior = 0;
                          });
                        }
                        break;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
