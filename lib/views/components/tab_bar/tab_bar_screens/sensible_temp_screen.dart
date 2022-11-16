import 'package:flutter/material.dart';

class SensibleTempScreen extends StatelessWidget {
  const SensibleTempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '체감온도',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
