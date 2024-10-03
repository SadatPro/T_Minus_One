import 'package:flutter/material.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  final TextEditingController _co2FluxController = TextEditingController();
  final TextEditingController _methaneEmissionsController =
      TextEditingController();
  double _result = 0.0;

  void calculateImpact() {
    final double co2Flux = double.tryParse(_co2FluxController.text) ?? 0.0;
    final double methaneEmissions =
        double.tryParse(_methaneEmissionsController.text) ?? 0.0;

    setState(() {
      // Example formula for calculation
      _result = co2Flux * 0.5 + methaneEmissions * 0.3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CO₂ Flux & Methane Emission Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _co2FluxController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Air-Sea CO₂ Flux (mol/m²/year)',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _methaneEmissionsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Wetland Methane Emissions (kg/year)',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateImpact,
              child: const Text('Calculate Impact'),
            ),
            const SizedBox(height: 16),
            Text('Total Environmental Impact: $_result'),
          ],
        ),
      ),
    );
  }
}
