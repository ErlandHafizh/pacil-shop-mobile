import 'package:flutter/material.dart';
import 'package:pacil_shop_mobile/screens/menu.dart';
import 'package:pacil_shop_mobile/screens/productentry_form.dart';
import 'package:pacil_shop_mobile/screens/list_productentry.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue, // Warna header drawer biru
            ),
            child: Column(
              children: [
                Text(
                  'Pacil Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Selamat berbelanja produk terbaik di Pacil Shop!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text('Daftar Produk'),
              onTap: () {
                  // Route menu ke halaman product
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductEntryPage()),
                  );
              },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
