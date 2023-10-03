// // import 'package:flutter/material.dart';
// //
// // class Calculator extends StatefulWidget {
// //   @override
// //   _CalculatorState createState() => _CalculatorState();
// // }
// //
// // class _CalculatorState extends State<Calculator> {
// //   String output = "0";
// //   String _output = "0";
// //   double num1 = 0.0;
// //   double num2 = 0.0;
// //   String operand = "";
// //
// //   buttonPressed(String buttonText) {
// //     if (buttonText == "C") {
// //       _output = "0";
// //       num1 = 0.0;
// //       num2 = 0.0;
// //       operand = "";
// //     } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
// //       num1 = double.parse(output);
// //       operand = buttonText;
// //       _output = "0";
// //     } else if (buttonText == "=") {
// //       num2 = double.parse(output);
// //       if (operand == "+") {
// //         _output = (num1 + num2).toString();
// //       }
// //       if (operand == "-") {
// //         _output = (num1 - num2).toString();
// //       }
// //       if (operand == "x") {
// //         _output = (num1 * num2).toString();
// //       }
// //       if (operand == "/") {
// //         if (num2 != 0) {
// //           _output = (num1 / num2).toString();
// //         } else {
// //           _output = "Error";
// //         }
// //       }
// //       num1 = 0.0;
// //       num2 = 0.0;
// //       operand = "";
// //     } else {
// //       _output += buttonText;
// //     }
// //
// //     setState(() {
// //       output = double.parse(_output).toStringAsFixed(2);
// //     });
// //   }
// //
// //   Widget buildButton(String buttonText) {
// //     return Expanded(
// //       child: ElevatedButton(
// //         onPressed: () => buttonPressed(buttonText),
// //         child: Text(
// //           buttonText,
// //           style: TextStyle(fontSize: 24.0),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Calculator'),
// //         backgroundColor: Colors.blue,
// //       ),
// //       body: Container(
// //         child: Column(
// //           children: <Widget>[
// //             Container(
// //               alignment: Alignment.centerRight,
// //               padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
// //               child: Text(
// //                 output,
// //                 style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //             Expanded(
// //               child: Divider(),
// //             ),
// //             Column(
// //               children: [
// //                 Row(
// //                   children: [
// //                     buildButton("7"),
// //                     buildButton("8"),
// //                     buildButton("9"),
// //                     buildButton("/"),
// //                   ],
// //                 ),
// //                 Row(
// //                   children: [
// //                     buildButton("4"),
// //                     buildButton("5"),
// //                     buildButton("6"),
// //                     buildButton("x"),
// //                   ],
// //                 ),
// //                 Row(
// //                   children: [
// //                     buildButton("1"),
// //                     buildButton("2"),
// //                     buildButton("3"),
// //                     buildButton("-"),
// //                   ],
// //                 ),
// //                 Row(
// //                   children: [
// //                     buildButton("."),
// //                     buildButton("0"),
// //                     buildButton("00"),
// //                     buildButton("+"),
// //                   ],
// //                 ),
// //                 Row(
// //                   children: [
// //                     buildButton("C"),
// //                     buildButton("="),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: Calculator(),
//   ));
// }
//
// class Calculator extends StatefulWidget {
//   @override
//   _CalculatorState createState() => _CalculatorState();
// }
//
// class _CalculatorState extends State<Calculator> {
//   String expression = "";
//   String _output = "0";
//
//   buttonPressed(String buttonText) {
//     if (buttonText == "C") {
//       setState(() {
//         expression = "";
//         _output = "0";
//       });
//     } else if (buttonText == "=") {
//       try {
//         // Calculate the result of the expression
//         final result = eval(expression);
//         setState(() {
//           _output = result.toString();
//           expression = "$expression = $_output";
//         });
//       } catch (e) {
//         setState(() {
//           _output = "Error";
//         });
//       }
//     } else {
//       setState(() {
//         expression += buttonText;
//       });
//     }
//   }
//
//   // Evaluate the expression
//   double eval(String expression) {
//     try {
//       // Remove spaces and replace 'x' with '*' for multiplication
//       expression = expression.replaceAll(' ', '').replaceAll('x', '*');
//       final result = double.parse(evalExpression(expression));
//       return result;
//     } catch (e) {
//       throw Exception("Invalid expression");
//     }
//   }
//
//   // Recursively evaluate the expression
//   String evalExpression(String expression) {
//     if (!expression.contains("(") && !expression.contains(")")) {
//       return expression;
//     } else {
//       final start = expression.lastIndexOf("(");
//       final end = expression.indexOf(")", start);
//       final inner = expression.substring(start + 1, end);
//       final value = eval(inner);
//       final newExpression = expression.replaceRange(start, end + 1, value.toString());
//       return evalExpression(newExpression);
//     }
//   }
//
//   Widget buildButton(String buttonText) {
//     return Expanded(
//       child: ElevatedButton(
//         onPressed: () => buttonPressed(buttonText),
//         child: Text(
//           buttonText,
//           style: TextStyle(fontSize: 24.0),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calculator'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Container(
//               alignment: Alignment.centerRight,
//               padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
//               child: Text(
//                 expression.isEmpty ? " " : expression,
//                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerRight,
//               padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
//               child: Text(
//                 _output,
//                 style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Expanded(
//               child: Divider(),
//             ),
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     buildButton("7"),
//                     buildButton("8"),
//                     buildButton("9"),
//                     buildButton("/"),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     buildButton("4"),
//                     buildButton("5"),
//                     buildButton("6"),
//                     buildButton("x"),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     buildButton("1"),
//                     buildButton("2"),
//                     buildButton("3"),
//                     buildButton("-"),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     buildButton("."),
//                     buildButton("0"),
//                     buildButton("00"),
//                     buildButton("+"),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     buildButton("("),
//                     buildButton(")"),
//                     buildButton("C"),
//                     buildButton("="),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
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
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        final result = exp.evaluate(EvaluationType.REAL, cm);
        setState(() {
          _output = result.toString();
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
        title: Text('Calculator'),
        backgroundColor: Colors.blue,
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
            Column(
              children: [
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
                    buildButton("x"),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
