import 'package:flutter/material.dart';


class ConversionCalculator extends StatefulWidget {
  @override
  _ConversionCalculatorState createState() => _ConversionCalculatorState();
}

class _ConversionCalculatorState extends State<ConversionCalculator> {
  String selectedFromUnit = 'Square Meter';
  String selectedToUnit = 'Square Meter';
  double inputValue = 0.0;
  double? result;

  final Map<String, double> conversionFactors = {
    'Square Meter': 1.0,
    'Square Kilometer': 1000000.0,  // Corrected conversion factor
    'Square Micrometer': 1.0e+12,
    'Square Centimeter': 10000.0,
    'Square Millimeter': 1000000.0,
  };

  void _convert() {
    final fromFactor = conversionFactors[selectedFromUnit];
    final toFactor = conversionFactors[selectedToUnit];

    if (fromFactor != null && toFactor != null) {
      setState(() {
        result = (inputValue * fromFactor) / toFactor;
      });
    } else {
      // Handle invalid unit selections or null factors
      setState(() {
        result = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversion Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: selectedFromUnit,
              onChanged: (value) {
                setState(() {
                  selectedFromUnit = value!;
                });
              },
              items: conversionFactors.keys.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  inputValue = double.tryParse(text) ?? 0.0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter Value',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedToUnit,
              onChanged: (value) {
                setState(() {
                  selectedToUnit = value!;
                });
              },
              items: conversionFactors.keys.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _convert();
              },
              child: Text('Convert'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            result != null
                ? Text(
              'Result: $result',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            )
                : Text(
              'Invalid input or unit selection.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
