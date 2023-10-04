import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TipCalculator(),
  ));
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double billAmount = 0.0;
  double tipPercentage = 15.0;
  double tipAmount = 0.0;
  double totalAmount = 0.0;

  void calculateTip() {
    tipAmount = (billAmount * tipPercentage) / 100;
    totalAmount = billAmount + tipAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  billAmount = double.tryParse(text) ?? 0.0;
                  calculateTip();
                });
              },
              decoration: InputDecoration(
                labelText: 'Bill Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  tipPercentage = double.tryParse(text) ?? 0.0;
                  calculateTip();
                });
              },
              decoration: InputDecoration(
                labelText: 'Tip Percentage (%)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tip Amount: \$${tipAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
