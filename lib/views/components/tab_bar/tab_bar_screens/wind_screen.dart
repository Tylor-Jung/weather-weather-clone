import 'package:flutter/material.dart';

class WindScreen extends StatelessWidget {
  const WindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '바람',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
