import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'agehistory.dart';

class AgeCalculatorScreen extends StatefulWidget {
  @override
  _AgeCalculatorScreenState createState() => _AgeCalculatorScreenState();
}

class _AgeCalculatorScreenState extends State<AgeCalculatorScreen> {
  DateTime? _selectedDate;
  int? _ageYears;
  int? _ageMonths;
  int? _ageDays;

  // Additional variables for features
  int? _totalDaysLived;
  int? _ageInMonths;

  // Define a list to store age history
  List<String> _ageHistory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _selectedDate != null
                  ? 'Selected Birthdate: ${DateFormat('dd-MM-yyyy').format(_selectedDate!)}'
                  : 'Select your birthdate',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select Birthdate'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              _ageYears != null && _ageMonths != null && _ageDays != null
                  ? 'Your Age: $_ageYears years $_ageMonths months $_ageDays days'
                  : '',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              _totalDaysLived != null
                  ? 'Total Days Lived: $_totalDaysLived days'
                  : '',
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Text(
              _ageInMonths != null
                  ? 'Age in Months: $_ageInMonths months'
                  : '',
              style: TextStyle(
                fontSize: 18,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _shareAge,
              child: Text('Share Age'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            // Display age history
            Text(
              'Age History:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () => _navigateToAgeHistoryScreen(context),
              child: Text('View Age History'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: _ageHistory.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text(_ageHistory[index]),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      if (_isDateValid(picked)) {
        setState(() {
          _selectedDate = picked;
          _calculateAge();
          _calculateTotalDaysLived();
          _calculateAgeInMonths();
          _addAgeToHistory();
        });
      } else {
        // Handle invalid date (e.g., show an error message).
      }
    }
  }

  bool _isDateValid(DateTime date) {
    final DateTime now = DateTime.now();
    return !date.isAfter(now) && date.year >= 1900;
  }

  void _calculateAge() {
    if (_selectedDate != null) {
      final now = DateTime.now();
      final difference = now.difference(_selectedDate!);
      setState(() {
        _ageYears = difference.inDays ~/ 365;
        _ageMonths = (difference.inDays % 365) ~/ 30;
        _ageDays = difference.inDays % 30;
      });
    }
  }
  void _navigateToAgeHistoryScreen(BuildContext context) async {
    final shouldClearHistory = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgeHistoryScreen(ageHistory: _ageHistory),
      ),
    );

    if (shouldClearHistory == true) {
      setState(() {
        _ageHistory.clear();
      });
    }
  }
  void _calculateTotalDaysLived() {
    if (_selectedDate != null) {
      final now = DateTime.now();
      final difference = now.difference(_selectedDate!);
      setState(() {
        _totalDaysLived = difference.inDays;
      });
    }
  }

  void _calculateAgeInMonths() {
    if (_selectedDate != null) {
      final now = DateTime.now();
      final difference = now.difference(_selectedDate!);
      setState(() {
        _ageInMonths = (difference.inDays / 30).floor();
      });
    }
  }

  void _addAgeToHistory() {
    if (_selectedDate != null && _ageYears != null) {
      final String ageInfo =
          'Selected Birthdate: ${DateFormat('dd-MM-yyyy').format(_selectedDate!)} - Age: $_ageYears years $_ageMonths months $_ageDays days';
      setState(() {
        _ageHistory.add(ageInfo);
      });
    }
  }

  void _shareAge() {
    final String ageInfo =
        'I am $_ageYears years $_ageMonths months $_ageDays days old!';
    // Use a package like 'share' to share the ageInfo on social media.
  }
}
