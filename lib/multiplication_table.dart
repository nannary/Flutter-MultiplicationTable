// multiplication_table.dart
import 'package:flutter/material.dart';

class MultiplicationTableScreen extends StatelessWidget {
  final String table;

  const MultiplicationTableScreen(this.table, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('โปรแกรมแม่สูตรคูณของนารีรัตน์'),
      ),
      body: Center(
        child: Text(table, style: TextStyle(fontSize: 30, color: Colors.green)),
      ),
    );
  }
}
