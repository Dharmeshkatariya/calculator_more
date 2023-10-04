// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: DateCalculator(),
//   ));
// }
//
// class DateCalculator extends StatefulWidget {
//   @override
//   _DateCalculatorState createState() => _DateCalculatorState();
// }
//
// class _DateCalculatorState extends State<DateCalculator> {
//   DateTime date1 = DateTime.now();
//   DateTime date2 = DateTime.now();
//   int result = 0;
//
//   // Function to calculate the difference in days between two dates
//   void _calculateDifference() {
//     final difference = date2.difference(date1).inDays;
//     setState(() {
//       result = difference;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Date Calculator'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Date Calculator',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Column(
//                   children: [
//                     Text('Select Date 1'),
//                     SizedBox(height: 10),
//                     TextButton(
//                       onPressed: () async {
//                         final selectedDate = await showDatePicker(
//                           context: context,
//                           initialDate: date1,
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2101),
//                         );
//                         if (selectedDate != null) {
//                           setState(() {
//                             date1 = selectedDate;
//                           });
//                         }
//                       },
//                       child: Text(
//                         '${date1.year}-${date1.month}-${date1.day}',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text('Select Date 2'),
//                     SizedBox(height: 10),
//                     TextButton(
//                       onPressed: () async {
//                         final selectedDate = await showDatePicker(
//                           context: context,
//                           initialDate: date2,
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2101),
//                         );
//                         if (selectedDate != null) {
//                           setState(() {
//                             date2 = selectedDate;
//                           });
//                         }
//                       },
//                       child: Text(
//                         '${date2.year}-${date2.month}-${date2.day}',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _calculateDifference();
//               },
//               child: Text('Calculate Difference'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Difference in Days: $result',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DateCalculator(),
  ));
}

class DateCalculator extends StatefulWidget {
  @override
  _DateCalculatorState createState() => _DateCalculatorState();
}

class _DateCalculatorState extends State<DateCalculator> {
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();
  int result = 0;

  // Function to calculate the difference in days between two dates
  void _calculateDifference() {
    final difference = date2.difference(date1).inDays;
    setState(() {
      result = difference;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Date Calculator'),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0, // No shadow
      // ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red.shade800, Colors.pink.shade400],
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Date Calculator',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            Card(
              elevation: 5, // Add shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('Select Date 1', style: TextStyle(color: Colors.black)),
                            SizedBox(height: 10),
                            TextButton(
                              onPressed: () async {
                                final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: date1,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (selectedDate != null) {
                                  setState(() {
                                    date1 = selectedDate;
                                  });
                                }
                              },
                              child: Text(
                                '${date1.year}-${date1.month}-${date1.day}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Select Date 2', style: TextStyle(color: Colors.black)),
                            SizedBox(height: 10),
                            TextButton(
                              onPressed: () async {
                                final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: date2,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (selectedDate != null) {
                                  setState(() {
                                    date2 = selectedDate;
                                  });
                                }
                              },
                              child: Text(
                                '${date2.year}-${date2.month}-${date2.day}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _calculateDifference();
                      },
                      child: Text('Calculate Difference'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Difference in Days: $result',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
