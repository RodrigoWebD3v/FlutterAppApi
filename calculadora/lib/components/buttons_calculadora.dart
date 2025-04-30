import 'package:flutter/material.dart';

class ButtonsCalculadora extends StatefulWidget {
  final Function(String, String) onButtonPressed;

  const ButtonsCalculadora({super.key, required this.onButtonPressed});

  @override
  State<StatefulWidget> createState() => _ButtonsCalculadoraState();
}

class _ButtonsCalculadoraState extends State<ButtonsCalculadora> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true, // Para evitar que o GridView ocupe todo o espaço
      crossAxisCount: 4, // 4 colunas (ideal para calculadora)
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('7', 'numero'),
          child: const Text('7'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('8', 'numero'),
          child: const Text('8'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('9', 'numero'),
          child: const Text('9'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('/', 'operacao'),
          child: const Text('/'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('4', 'numero'),
          child: const Text('4'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('5', 'numero'),
          child: const Text('5'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('6', 'numero'),
          child: const Text('6'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('x', 'operacao'),
          child: const Text('x'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('1', 'numero'),
          child: const Text('1'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('2', 'numero'),
          child: const Text('2'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('3', 'numero'),
          child: const Text('3'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('-', 'operacao'),
          child: const Text('-'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('0', 'numero'),
          child: const Text('0'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('C', 'operacao'),
          child: const Text('C'),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('=', 'operacao'),
          child: const Text('='),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed('+', 'operacao'),
          child: const Text('+'),
        ),
      ],
    );
  }
}
