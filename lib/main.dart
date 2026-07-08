import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hola mundo",
      home: RecibeBook(),
    );
  }
}

class RecibeBook extends StatelessWidget {
  const RecibeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Recipe Book", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
