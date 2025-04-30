import 'package:flutter/material.dart';

class Visor extends StatefulWidget {
  final int valorAtual;

  const Visor({super.key, required this.valorAtual});

  @override
  State<Visor> createState() => _VisorState();
}

class _VisorState extends State<Visor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: const Color.fromARGB(255, 64, 109, 233),
      child: Text(
        widget.valorAtual.toString(),
        style: TextStyle(fontSize: 48, color: Colors.white),
        textAlign: TextAlign.right,
      ),
    );
  }
}
