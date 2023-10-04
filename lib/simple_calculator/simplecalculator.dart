// // import 'package:flutter/material.dart';
// // import 'package:math_expressions/math_expressions.dart';
// //
// // void main() {
// //   runApp(MaterialApp(
// //     home: SimpleCal(),
// //   ));
// // }
// //
// // class SimpleCal extends StatefulWidget {
// //   @override
// //   _SimpleCalState createState() => _SimpleCalState();
// // }
// //
// // class _SimpleCalState extends State<SimpleCal> {
// //   String expression = "";
// //   String _output = "0";
// //
// //   buttonPressed(String buttonText) {
// //     if (buttonText == "C") {
// //       setState(() {
// //         expression = "";
// //         _output = "0";
// //       });
// //     } else if (buttonText == "=") {
// //       try {
// //         Parser p = Parser();
// //         // Replace 'x' with '*' for multiplication
// //         expression = expression.replaceAll('x', '*');
// //         Expression exp = p.parse(expression);
// //         ContextModel cm = ContextModel();
// //         final result = exp.evaluate(EvaluationType.REAL, cm);
// //         setState(() {
// //           _output = result.toString();
// //         });
// //       } catch (e) {
// //         setState(() {
// //           _output = "Error";
// //         });
// //       }
// //     } else {
// //       setState(() {
// //         expression += buttonText;
// //       });
// //     }
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
// //         title: Text('SimpleCal'),
// //         backgroundColor: Colors.blue,
// //       ),
// //       body: Container(
// //         child: Column(
// //           children: <Widget>[
// //             Container(
// //               alignment: Alignment.centerRight,
// //               padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
// //               child: Text(
// //                 expression.isEmpty ? " " : expression,
// //                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //             Container(
// //               alignment: Alignment.centerRight,
// //               padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
// //               child: Text(
// //                 _output,
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
// //                     buildButton("x"), // Use 'x' for multiplication
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
// //                     buildButton("("),
// //                     buildButton(")"),
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
// import 'package:math_expressions/math_expressions.dart';
//
// import 'cal_history.dart';
//
// class SimpleCal extends StatefulWidget {
//   @override
//   _SimpleCalState createState() => _SimpleCalState();
// }
//
// class _SimpleCalState extends State<SimpleCal> {
//   String expression = "";
//   String _output = "0";
//   List<HistoryItem> historyItems = [];
//
//   void addToHistory(String expression, String result) {
//     final timestamp = DateTime.now();
//     final historyItem = HistoryItem(
//       expression: expression,
//       result: result,
//       timestamp: timestamp,
//     );
//     setState(() {
//       historyItems.insert(0, historyItem); // Insert at the beginning of the list.
//     });
//   }
//
//   buttonPressed(String buttonText) {
//     if (buttonText == "C") {
//       setState(() {
//         expression = "";
//         _output = "0";
//       });
//     } else if (buttonText == "=") {
//       try {
//         Parser p = Parser();
//         // Replace 'x' with '*' for multiplication
//         expression = expression.replaceAll('x', '*');
//         Expression exp = p.parse(expression);
//         ContextModel cm = ContextModel();
//         final result = exp.evaluate(EvaluationType.REAL, cm).toString();
//         setState(() {
//           _output = result;
//           addToHistory(expression, result) ;
//           // calculationHistory.add("$expression = $result");
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
//       // appBar: AppBar(
//       //   title: Text('SimpleCal'),
//       //   backgroundColor: Colors.blue,
//       //   actions: [
//       //     IconButton(
//       //       icon: Icon(Icons.history),
//       //       onPressed: () {
//       //         Navigator.push(
//       //           context,
//       //           MaterialPageRoute(
//       //             builder: (context) => HistoryScreen(history: calculationHistory),
//       //           ),
//       //         );
//       //       },
//       //     ),
//       //   ],
//       // ),
//       appBar: AppBar(
//         title: Text('Calculator'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.history),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => HistoryView(historyItems: historyItems),
//                 ),
//               );
//             },
//           ),
//         ],
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
//                     buildButton("x"), // Use 'x' for multiplication
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
// class HistoryItem {
//   final String expression;
//   final String result;
//   final DateTime timestamp;
//
//   HistoryItem({
//     required this.expression,
//     required this.result,
//     required this.timestamp,
//   });
// }
//
//
//
// class HistoryView extends StatefulWidget {
//   final List<HistoryItem> historyItems;
//
//   HistoryView({required this.historyItems});
//
//   @override
//   _HistoryViewState createState() => _HistoryViewState();
// }
//
// class _HistoryViewState extends State<HistoryView> {
//   bool isAscending = true;
//
//   @override
//   Widget build(BuildContext context) {
//     // Sort the history items based on timestamp and order.
//     final sortedItems = List<HistoryItem>.from(widget.historyItems);
//     sortedItems.sort((a, b) => isAscending ? a.timestamp.compareTo(b.timestamp) : b.timestamp.compareTo(a.timestamp));
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('History'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.sort),
//             onPressed: () {
//               setState(() {
//                 isAscending = !isAscending;
//               });
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: sortedItems.length,
//         itemBuilder: (context, index) {
//           final item = sortedItems[index];
//           final formattedTimestamp = "${item.timestamp.day} ${_getMonthName(item.timestamp.month)} ${item.timestamp.year}";
//           return ListTile(
//             title: Text(item.expression),
//             subtitle: Text('Result: ${item.result}  Date: $formattedTimestamp'),
//           );
//         },
//       ),
//     );
//   }
//
//   String _getMonthName(int month) {
//     const monthNames = [
//       'January', 'February', 'March', 'April', 'May', 'June',
//       'July', 'August', 'September', 'October', 'November', 'December'
//     ];
//     return monthNames[month - 1];
//   }
// }
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    home: SimpleCal(),
  ));
}

class SimpleCal extends StatefulWidget {
  @override
  _SimpleCalState createState() => _SimpleCalState();
}

class _SimpleCalState extends State<SimpleCal> {
  String expression = "";
  String _output = "0";
  List<HistoryItem> historyItems = [];
  double memory = 0.0;

  void addToHistory(String expression, String result) {
    final timestamp = DateTime.now();
    final historyItem = HistoryItem(
      expression: expression,
      result: result,
      timestamp: timestamp,
    );
    setState(() {
      historyItems.insert(0, historyItem);
    });
  }

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
          addToHistory(expression, result);
        });
      } catch (e) {
        setState(() {
          _output = "Error";
        });
      }
    } else if (buttonText == "M+") {
      setState(() {
        memory += double.parse(_output);
      });
    } else if (buttonText == "M-") {
      setState(() {
        memory -= double.parse(_output);
      });
    } else if (buttonText == "MR") {
      setState(() {
        _output = memory.toString();
      });
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
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryView(historyItems: historyItems),
                ),
              );
            },
          ),
        ],
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
                Row(
                  children: [
                    buildButton("M+"),
                    buildButton("M-"),
                    buildButton("MR"),
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

class HistoryItem {
  final String expression;
  final String result;
  final DateTime timestamp;

  HistoryItem({
    required this.expression,
    required this.result,
    required this.timestamp,
  });
}

class HistoryView extends StatefulWidget {
  final List<HistoryItem> historyItems;

  HistoryView({required this.historyItems});

  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  bool isAscending = true;

  @override
  Widget build(BuildContext context) {
    final sortedItems = List<HistoryItem>.from(widget.historyItems);
    sortedItems.sort((a, b) => isAscending ? a.timestamp.compareTo(b.timestamp) : b.timestamp.compareTo(a.timestamp));

    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              setState(() {
                isAscending = !isAscending;
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: sortedItems.length,
        itemBuilder: (context, index) {
          final item = sortedItems[index];
          final formattedTimestamp = "${item.timestamp.day} ${_getMonthName(item.timestamp.month)} ${item.timestamp.year}";
          return ListTile(
            title: Text(item.expression),
            subtitle: Text('Result: ${item.result}  Date: $formattedTimestamp'),
          );
        },
      ),
    );
  }

  String _getMonthName(int month) {
    const monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month - 1];
  }
}
