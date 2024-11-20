import 'package:flutter/material.dart';
import 'package:pacil_shop_mobile/widgets/left_drawer.dart';
import 'package:pacil_shop_mobile/screens/productentry_form.dart';
import 'package:pacil_shop_mobile/screens/list_productentry.dart';
import 'package:pacil_shop_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pacil_shop_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.view_list, Colors.blue),
    ItemHomepage("Tambah Produk", Icons.add, Colors.green),
    ItemHomepage("Logout", Icons.logout, Colors.red),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Pacil Shop',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFBDE6F2),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                'Welcome to Pacil Shop',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              // Use Expanded to fit the GridView within the remaining space
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: items.map((ItemHomepage item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>(); // Akses CookieRequest
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          if (item.name == "Lihat Daftar Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const ProductEntryPage(), // Arahkan ke halaman ProductEntryPage
              ),
            );
          } else if (item.name == "Logout") {
            // Lakukan logout
            await request.logout("http://127.0.0.1:8000/auth/logout/");
            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('Anda berhasil logout.')),
                );
            }
          } else if (item.name == "Tambah Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryFormPage(),
              ),
            );
          } else {
            String message = "Kamu telah menekan tombol ${item.name}";
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(message)));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const SizedBox(height: 3),
                Text(item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
