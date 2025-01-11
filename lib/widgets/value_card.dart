import 'package:flutter/material.dart';

class ValueCard extends StatelessWidget {
  final String label;
  final int value;
  final double? sliderValue;
  final ValueChanged<double>? onChanged;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const ValueCard({
    super.key,
    required this.label,
    required this.value,
    this.sliderValue,
    this.onChanged,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (sliderValue != null && onChanged != null)
              Column(
                children: [
                  Slider(
                    value: sliderValue!,
                    min: 100,
                    max: 250,
                    divisions: 150,
                    label: sliderValue!.toStringAsFixed(1),
                    onChanged: onChanged,
                  ),
                  Text(
                    '${sliderValue!.toInt()} cm',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onDecrement,
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    '$value',
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: onIncrement,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
