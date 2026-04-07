import 'package:flutter/material.dart';

// 1. IMPORT WIDGET BUATANMU DI SINI
// Sesuaikan dengan nama file yang sedang kamu kerjakan di Langkah 3-6
import 'basic_widgets/fab_widget.dart';
import 'basic_widgets/loading_cupertino.dart';
import 'basic_widgets/scaffold_widget.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Mengatur warna tema utama aplikasi
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      
      // 2. PANGGIL WIDGET BUATANMU DI SINI
      // Ganti MyScaffoldWidget() sesuai dengan nama class di file barumu nanti
      // (misalnya ganti jadi const MyDialogWidget(), const MyInputWidget(), dll)
      home: const MyScaffoldWidget(), 
    );
  }
}