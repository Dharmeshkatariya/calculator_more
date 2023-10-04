// // // import 'package:flutter/material.dart';
// // //
// // // void main() {
// // //   runApp(MaterialApp(
// // //     home: MortgageCalculator(),
// // //   ));
// // // }
// // //
// // // class MortgageCalculator extends StatefulWidget {
// // //   @override
// // //   _MortgageCalculatorState createState() => _MortgageCalculatorState();
// // // }
// // //
// // // class _MortgageCalculatorState extends State<MortgageCalculator> {
// // //   double principal = 0.0;
// // //   double interestRate = 0.0;
// // //   int loanTerm = 0;
// // //   double monthlyPayment = 0.0;
// // //
// // //   void calculateMonthlyPayment() {
// // //     if (principal > 0 && interestRate > 0 && loanTerm > 0) {
// // //       double monthlyInterestRate = interestRate / 1200; // Monthly interest rate
// // //       int numberOfPayments = loanTerm * 12; // Total number of payments
// // //       double numerator = principal * monthlyInterestRate;
// // //       double denominator = 1 - (1 / (1 + monthlyInterestRate).pow(numberOfPayments * -1));
// // //       double result = numerator / denominator;
// // //       setState(() {
// // //         monthlyPayment = result;
// // //       });
// // //     } else {
// // //       setState(() {
// // //         monthlyPayment = 0.0;
// // //       });
// // //     }
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Mortgage Calculator'),
// // //         backgroundColor: Colors.blue,
// // //       ),
// // //       body: Container(
// // //         padding: EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.center,
// // //           children: <Widget>[
// // //             TextField(
// // //               keyboardType: TextInputType.number,
// // //               onChanged: (text) {
// // //                 setState(() {
// // //                   principal = double.tryParse(text) ?? 0.0;
// // //                 });
// // //               },
// // //               decoration: InputDecoration(
// // //                 labelText: 'Principal Amount',
// // //                 border: OutlineInputBorder(),
// // //               ),
// // //             ),
// // //             SizedBox(height: 20),
// // //             TextField(
// // //               keyboardType: TextInputType.number,
// // //               onChanged: (text) {
// // //                 setState(() {
// // //                   interestRate = double.tryParse(text) ?? 0.0;
// // //                 });
// // //               },
// // //               decoration: InputDecoration(
// // //                 labelText: 'Annual Interest Rate (%)',
// // //                 border: OutlineInputBorder(),
// // //               ),
// // //             ),
// // //             SizedBox(height: 20),
// // //             TextField(
// // //               keyboardType: TextInputType.number,
// // //               onChanged: (text) {
// // //                 setState(() {
// // //                   loanTerm = int.tryParse(text) ?? 0;
// // //                 });
// // //               },
// // //               decoration: InputDecoration(
// // //                 labelText: 'Loan Term (years)',
// // //                 border: OutlineInputBorder(),
// // //               ),
// // //             ),
// // //             SizedBox(height: 20),
// // //             ElevatedButton(
// // //               onPressed: calculateMonthlyPayment,
// // //               child: Text('Calculate'),
// // //               style: ElevatedButton.styleFrom(
// // //                 primary: Colors.blue,
// // //               ),
// // //             ),
// // //             SizedBox(height: 20),
// // //             Text(
// // //               'Monthly Payment: \$${monthlyPayment.toStringAsFixed(2)}',
// // //               style: TextStyle(
// // //                 fontSize: 24,
// // //                 fontWeight: FontWeight.bold,
// // //                 color: Colors.blue,
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       backgroundColor: Colors.white,
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'dart:math'; // Import the math library for pow function
// //
// // void main() {
// //   runApp(MaterialApp(
// //     home: MortgageCalculator(),
// //   ));
// // }
// //
// // class MortgageCalculator extends StatefulWidget {
// //   @override
// //   _MortgageCalculatorState createState() => _MortgageCalculatorState();
// // }
// //
// // class _MortgageCalculatorState extends State<MortgageCalculator> {
// //   double principal = 0.0;
// //   double interestRate = 0.0;
// //   int loanTerm = 0;
// //   double monthlyPayment = 0.0;
// //
// //   void calculateMonthlyPayment() {
// //     if (principal > 0 && interestRate > 0 && loanTerm > 0) {
// //       double monthlyInterestRate = interestRate / 1200; // Monthly interest rate
// //       int numberOfPayments = loanTerm * 12; // Total number of payments
// //
// //       // Calculate the monthly payment using the formula
// //       double result = (principal * monthlyInterestRate) /
// //           (1 - pow(1 + monthlyInterestRate, -numberOfPayments));
// //
// //       setState(() {
// //         monthlyPayment = result;
// //       });
// //     } else {
// //       setState(() {
// //         monthlyPayment = 0.0;
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Mortgage Calculator'),
// //         backgroundColor: Colors.blue,
// //       ),
// //       body: Container(
// //         padding: EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: <Widget>[
// //             TextField(
// //               keyboardType: TextInputType.number,
// //               onChanged: (text) {
// //                 setState(() {
// //                   principal = double.tryParse(text) ?? 0.0;
// //                 });
// //               },
// //               decoration: InputDecoration(
// //                 labelText: 'Principal Amount',
// //                 border: OutlineInputBorder(),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             TextField(
// //               keyboardType: TextInputType.number,
// //               onChanged: (text) {
// //                 setState(() {
// //                   interestRate = double.tryParse(text) ?? 0.0;
// //                 });
// //               },
// //               decoration: InputDecoration(
// //                 labelText: 'Annual Interest Rate (%)',
// //                 border: OutlineInputBorder(),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             TextField(
// //               keyboardType: TextInputType.number,
// //               onChanged: (text) {
// //                 setState(() {
// //                   loanTerm = int.tryParse(text) ?? 0;
// //                 });
// //               },
// //               decoration: InputDecoration(
// //                 labelText: 'Loan Term (years)',
// //                 border: OutlineInputBorder(),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: calculateMonthlyPayment,
// //               child: Text('Calculate'),
// //               style: ElevatedButton.styleFrom(
// //                 primary: Colors.blue,
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Text(
// //               'Monthly Payment: ${monthlyPayment.toStringAsFixed(2)}',
// //               style: TextStyle(
// //                 fontSize: 24,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.blue,
// //               ),
// //             ),
// //
// //           ],
// //         ),
// //       ),
// //       backgroundColor: Colors.white,
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: MortgageCalculator(),
//   ));
// }
//
// class MortgageCalculator extends StatefulWidget {
//   @override
//   _MortgageCalculatorState createState() => _MortgageCalculatorState();
// }
//
// class _MortgageCalculatorState extends State<MortgageCalculator> {
//   double principal = 200000; // Example principal amount
//   double annualInterestRate = 4.0; // Example annual interest rate (in percent)
//   int numberOfYears = 30; // Example loan term in years
//   double monthlyInterestRate = 0.0;
//   int numberOfPayments = 0;
//   double monthlyPayment = 0.0;
//   double totalPayment = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     calculateMonthlyPayment();
//   }
//
//   void calculateMonthlyPayment() {
//     monthlyInterestRate = annualInterestRate / 12 / 100;
//     numberOfPayments = numberOfYears * 12;
//
//     // Calculate exponentiation manually
//     final double powBase = 1 + monthlyInterestRate;
//     double exponentiation = 1.0;
//     for (int i = 0; i < numberOfPayments.abs(); i++) {
//       exponentiation *= powBase;
//     }
//
//     final denominator = 1 - (1 / exponentiation);
//     monthlyPayment = principal * monthlyInterestRate / denominator;
//     totalPayment = monthlyPayment * numberOfPayments;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mortgage Calculator'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Principal: \$${principal.toStringAsFixed(2)}',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Annual Interest Rate: ${annualInterestRate.toStringAsFixed(2)}%',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Number of Years: $numberOfYears',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Monthly Payment: \$${monthlyPayment.toStringAsFixed(2)}',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//             Text(
//               'Total Payment: \$${totalPayment.toStringAsFixed(2)}',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.green,
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
    home: MortgageCalculator(),
  ));
}

class MortgageCalculator extends StatefulWidget {
  @override
  _MortgageCalculatorState createState() => _MortgageCalculatorState();
}

class _MortgageCalculatorState extends State<MortgageCalculator> {
  double principal = 0.0; // The user-entered principal amount
  double annualInterestRate = 0.0;
  int numberOfYears = 0;
  double monthlyInterestRate = 0.0;
  int numberOfPayments = 0;
  double monthlyPayment = 0.0;
  double totalPayment = 0.0;

  void calculateMonthlyPayment() {
    monthlyInterestRate = annualInterestRate / 12 / 100;
    numberOfPayments = numberOfYears * 12;
    final double powBase = 1 + monthlyInterestRate;
    double exponentiation = 1.0;
    for (int i = 0; i < numberOfPayments.abs(); i++) {
      exponentiation *= powBase;
    }
    final denominator = 1 - (1 / exponentiation);
    monthlyPayment = principal * monthlyInterestRate / denominator;
    totalPayment = monthlyPayment * numberOfPayments;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mortgage Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  principal = double.tryParse(text) ?? 0.0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Principal Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  annualInterestRate = double.tryParse(text) ?? 0.0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Annual Interest Rate (%)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  numberOfYears = int.tryParse(text) ?? 0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Number of Years',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateMonthlyPayment();
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              'Monthly Payment: \$${monthlyPayment.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Total Payment: \$${totalPayment.toStringAsFixed(2)}',
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
