// main.dart
import 'package:flutter/material.dart';
import 'multiplication_table.dart'; // Import เพิ่มเติม

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'โปรแกรมแม่สูตรคูณของนารีรัตน์'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String? _multiplicationTable;

  void _generateMultiplicationTable() {
    int? number = int.tryParse(_controller.text);
    if (number != null) {
      // Generate multiplication table
      String table = '';
      for (int i = 1; i <= 12; i++) {
        table += '$number x $i = ${number * i}\n';
      }

      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MultiplicationTableScreen(table),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'ป้อนตัวเลขที่ต้องการ'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateMultiplicationTable,
              child: Text('คำนวณ'),
            ),
          ],
        ),
      ),
    );
  }
}
