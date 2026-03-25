import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: GradientLoopDemo(),
    debugShowCheckedModeBanner: false,
  ));
}

class GradientLoopDemo extends StatefulWidget {
  const GradientLoopDemo({super.key});

  @override
  State<GradientLoopDemo> createState() => _GradientLoopDemoState();
}

class _GradientLoopDemoState extends State<GradientLoopDemo> {
  double _angle = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Atualiza o ângulo a cada 50ms (~20 FPS)
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        _angle += 0.01;
        if (_angle > 2 * math.pi) _angle = 0;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue, Colors.pink],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(_angle),
          ),
        ),
        child: const Center(
          child: Text(
            'Animação de Gradiente em Loop',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
