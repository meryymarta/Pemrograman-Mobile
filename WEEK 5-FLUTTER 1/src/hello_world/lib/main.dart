import 'package:flutter/material.dart';

// 1. IMPORT WIDGET FAB (Floating Action Button)
// Pastikan nama filenya benar-benar fab_widget.dart ya
import 'basic_widgets/fab_widget.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      
      // 2. PANGGIL WIDGET-NYA DI SINI
      // Ganti jadi memanggil class FabWidget
      home: const FabWidget(), 
    );
  }
}