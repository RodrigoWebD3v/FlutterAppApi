import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // <- aqui é onde deve ficar o único MaterialApp
      title: 'Flutter Demo',
      home: BatteryLevelPage(),
    );
  }
}

class BatteryLevelPage extends StatefulWidget {
  const BatteryLevelPage({super.key});

  @override
  State<StatefulWidget> createState() => _BatteryLevelPageState();
}

class _BatteryLevelPageState extends State<BatteryLevelPage> {
  static const platform = MethodChannel("com.rodrigo/bateria");

  Future<void> _obterNivelBateria(BuildContext context) async {
    String mensagem;
    try {
      final int nivel = await platform.invokeMethod('obterNivelBateria');
      mensagem = 'Nível da bateria: $nivel%.';
    } on PlatformException catch (e) {
      mensagem = "Erro ao obter nível da bateria: '${e.message}'.";
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensagem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo Bateria')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _obterNivelBateria(context);
          },
          child: const Text('Obter Nível da Bateria'),
        ),
      ),
    );
  }
}
