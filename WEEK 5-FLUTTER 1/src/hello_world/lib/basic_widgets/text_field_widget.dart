import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatelessWidget {
  const MyTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Kita cuma me-return Scaffold-nya saja
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contoh TextField"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0), 
        child: TextField(
          obscureText: false, 
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nama',
          ),
        ),
      ),
    );
  }
}