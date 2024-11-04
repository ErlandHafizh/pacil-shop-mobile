import 'package:flutter/material.dart';
import 'package:pacil_shop_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacil Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
        ).copyWith(secondary: Colors.deepPurple[900]),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
