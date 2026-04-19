import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        const Icon(Icons.star, color: Colors.black),
        const Icon(Icons.star, color: Colors.black),
      ],
    );

    // 2. Gabungkan bintang dengan teks ulasan
    final ratings = Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          const Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );

    // 1. Buat gaya teks standar untuk bagian info
    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    // 2. Buat baris berisi ikon dan teks info
    final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                const Text('PREP:'),
                const Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                const Text('COOK:'),
                const Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                const Text('FEEDS:'),
                const Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    final leftColumn = Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          // Judul resep
          const Text(
            'Strawberry Pavlova',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),

          // Deskripsi resep
          const Text(
            'Pavlovaaa is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Georgia', fontSize: 16),
          ),
          ratings,
          iconList,
        ],
      ),
    );

    // 6. Gambar Utama (Link sudah diganti dengan yang baru)
   final mainImage = Image.asset(
      'images/strawberry-pavlova-1x1.webp', 
      fit: BoxFit.cover,
    );

   return MaterialApp(
      title: 'Strawberry Pavlova',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Strawberry Pavlova Recipe'),
        ),
        body: Center(
          // Kita bungkus dengan Container agar punya batas ukuran
           child: Container(
            margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
            height: 600, // Batasan tinggi keseluruhan
            child: Card( // Memberikan efek kotak seperti kartu
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 400,
                    child: leftColumn,
                  ),
                  Expanded(
                    child: mainImage,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}