import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    home: ScientificCal(),
  ));
}

class ScientificCal extends StatefulWidget {
  @override
  _ScientificCalState createState() => _ScientificCalState();
}

class _ScientificCalState extends State<ScientificCal> {
  String expression = "";
  String _output = "0";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      setState(() {
        expression = "";
        _output = "0";
      });
    } else if (buttonText == "=") {
      try {
        Parser p = Parser();
        expression = expression.replaceAll('x', '*');
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        final result = exp.evaluate(EvaluationType.REAL, cm).toString();
        setState(() {
          _output = result;
        });
      } catch (e) {
        setState(() {
          _output = "Error";
        });
      }
    } else {
      setState(() {
        expression += buttonText;
      });
    }
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scientific Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                expression.isEmpty ? " " : expression,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Row(
              children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ],
            ),
            Row(
              children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("x"), // Use 'x' for multiplication
              ],
            ),
            Row(
              children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ],
            ),
            Row(
              children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+"),
              ],
            ),
            Row(
              children: [
                buildButton("("),
                buildButton(")"),
                buildButton("C"),
                buildButton("="),
              ],
            ),
            Row(
              children: [
                buildButton("sin"),
                buildButton("cos"),
                buildButton("tan"),
                buildButton("√"), // Square root symbol
              ],
            ),
            Row(
              children: [
                buildButton("log"),
                buildButton("ln"),
                buildButton("^"), // Exponent symbol
                buildButton("π"), // Pi symbol
              ],
            ),
          ],
        ),
      ),
    );
  }
}
