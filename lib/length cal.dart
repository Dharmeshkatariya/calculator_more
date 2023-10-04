
import 'package:flutter/material.dart';


enum LengthUnit { meter, kilometer, centimeter, millimeter }

class LengthConverter extends StatefulWidget {
  @override
  _LengthConverterState createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  LengthUnit fromUnit = LengthUnit.meter;
  LengthUnit toUnit = LengthUnit.meter;
  double inputValue = 0.0;
  double result = 0.0;

  final Map<LengthUnit, String> unitNames = {
    LengthUnit.meter: 'Meter',
    LengthUnit.kilometer: 'Kilometer',
    LengthUnit.centimeter: 'Centimeter',
    LengthUnit.millimeter: 'Millimeter',
  };

  void _convert() {
    final conversionFactors = {
      LengthUnit.meter: 1,
      LengthUnit.kilometer: 1000,
      LengthUnit.centimeter: 0.01,
      LengthUnit.millimeter: 0.001,
    };

    final fromFactor = conversionFactors[fromUnit];
    final toFactor = conversionFactors[toUnit];

    if (fromFactor != null && toFactor != null) {
      setState(() {
        result = (inputValue * fromFactor) / toFactor;
      });
    } else {
      // Handle invalid unit selections or null factors
      setState(() {
        result = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Length Converter'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Length Converter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<LengthUnit>(
                  value: fromUnit,
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                    });
                  },
                  items: LengthUnit.values.map((unit) {
                    return DropdownMenuItem<LengthUnit>(
                      value: unit,
                      child: Text(unitNames[unit]!),
                    );
                  }).toList(),
                ),
                Icon(
                  Icons.compare_arrows,
                  size: 30,
                  color: Colors.blue,
                ),
                DropdownButton<LengthUnit>(
                  value: toUnit,
                  onChanged: (value) {
                    setState(() {
                      toUnit = value!;
                    });
                  },
                  items: LengthUnit.values.map((unit) {
                    return DropdownMenuItem<LengthUnit>(
                      value: unit,
                      child: Text(unitNames[unit]!),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _convert();
              },
              child: Text('Convert'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $result',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
