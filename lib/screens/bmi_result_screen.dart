import 'package:flutter/material.dart';
import '../utils/bmi_calculator.dart';

class BMIResultScreen extends StatelessWidget {
  final double bmi;

  const BMIResultScreen({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    String status = BMICalculator.getStatus(bmi);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil BMI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI Anda: ${bmi.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              'Status: $status',
              style: const TextStyle(fontSize: 22),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
