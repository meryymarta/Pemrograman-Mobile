import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Sugar Premium', 
      price: 15000, 
      imageUrl: 'https://images.unsplash.com/photo-1592663527359-cf6642f54cff?w=500', 
      stock: 20, 
      rating: 4.8
    ),
    Item(
      name: 'Sea Salt', 
      price: 8000, 
      imageUrl: 'https://images.unsplash.com/photo-1626200419199-391ae4be7a41?w=500', 
      stock: 50, 
      rating: 4.5
    ),
    Item(
      name: 'Olive Oil', 
      price: 45000, 
      imageUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500', 
      stock: 15, 
      rating: 4.7
    ),

    Item (
      name: 'Honey Apple', 
      price: 12000, 
      imageUrl: 'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?w=500', 
      stock: 30, 
      rating: 4.6
    ),
     Item(
      name: 'Americano', 
      price: 35000, 
      imageUrl: 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=500', 
      stock: 10, 
      rating: 4.9
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], 
      appBar: AppBar(
        title: const Text('Mery Shop', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 0.72,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(item: items[index]);
        },
      ),
      // Footer yang lebih rapi menggunakan BottomAppBar
      bottomNavigationBar: SafeArea(
  child: BottomAppBar(
    color: Colors.white,
    elevation: 10,
    child: Container(
      height: 60, 
      alignment: Alignment.center,
      child: const Text(
        'Meriam Oktavia Martadinata | 244107060018',
        style: TextStyle(
          color: Colors.indigo, 
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
  ),
),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/item', arguments: item),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: 'productImage${item.name}',
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    item.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rp ${item.price}',
                    style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          Text(' ${item.rating}', style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      Text('Stok: ${item.stock}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}