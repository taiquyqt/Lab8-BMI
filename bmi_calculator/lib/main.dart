import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: BMICalculatorScreen(),
      ),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double? _bmi;

  void calculateBMI() {
    final double height = double.parse(heightController.text) / 100;
    final double weight = double.parse(weightController.text);
    setState(() {
      _bmi = weight / (height * height);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Chiều cao (cm)',
            ),
          ),
          TextField(
            controller: weightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Cân nặng (kg)',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: calculateBMI,
            child: const Text('Tính BMI'),
          ),
          const SizedBox(height: 20),
          if (_bmi != null)
            Text(
              'Chỉ số BMI: ${_bmi!.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
        ],
      ),
    );
  }
}
