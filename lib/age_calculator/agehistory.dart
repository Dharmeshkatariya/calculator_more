import 'package:flutter/material.dart';

class AgeHistoryScreen extends StatelessWidget {
  final List<String> ageHistory;

  AgeHistoryScreen({required this.ageHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age History'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: ageHistory.length,
        itemBuilder: (context, index) {
          final ageRecord = ageHistory[index];
          return ListTile(
            title: Text(ageRecord),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Clear all history records
          Navigator.pop(context, true);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
