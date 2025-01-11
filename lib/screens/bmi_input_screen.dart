import 'package:flutter/material.dart';
import 'bmi_result_screen.dart';
import 'history_screen.dart';
import '../utils/bmi_calculator.dart';

class BMIInputScreen extends StatefulWidget {
  const BMIInputScreen({super.key});

  @override
  State<BMIInputScreen> createState() => _BMIInputScreenState();
}

class _BMIInputScreenState extends State<BMIInputScreen> {
  double weight = 60.0;
  double height = 170.0;

  // Mode gelap/terang
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator BMI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Masukkan Tinggi dan Berat Badan',
                  style: TextStyle(fontSize: 18),
                ),
                Slider(
                  value: height,
                  min: 100,
                  max: 200,
                  divisions: 100,
                  label: '${height.toStringAsFixed(1)} cm',
                  onChanged: (value) {
                    setState(() {
                      height = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                Slider(
                  value: weight,
                  min: 30,
                  max: 150,
                  divisions: 120,
                  label: '${weight.toStringAsFixed(1)} kg',
                  onChanged: (value) {
                    setState(() {
                      weight = value;
                    });
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              double bmi = BMICalculator.calculateBMI(weight, height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BMIResultScreen(bmi: bmi),
                ),
              );
            },
            child: const Text('Hitung BMI'),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'history',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HistoryScreen(),
                ),
              );
            },
            tooltip: 'Lihat Riwayat BMI',
            child: const Icon(Icons.history),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'theme',
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
              if (isDarkMode) {
                ThemeData.dark();
              } else {
                ThemeData.light();
              }
            },
            tooltip: 'Ganti Mode Gelap/Terang',
            child: const Icon(Icons.brightness_6),
          ),
        ],
      ),
    );
  }
}
