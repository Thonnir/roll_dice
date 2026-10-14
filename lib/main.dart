import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const RollDiceApp());
}

class RollDiceApp extends StatelessWidget {
  const RollDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF2E1A47),
        body: Center(child: DiceRoller()),
      ),
    );
  }
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  final _random = Random();
  var _currentFace = 1;

  void _rollDice() {
    setState(() {
      _currentFace = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/dice-$_currentFace.png', width: 200),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: _rollDice,
          child: const Text('Hoď kockou', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
