import 'package:flutter/material.dart';

class HumidityScreen extends StatelessWidget {
  const HumidityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '습도',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
