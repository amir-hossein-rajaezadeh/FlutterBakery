import 'package:flutter/material.dart';
import 'package:flutter_bakery_shop/screens/brown_screen.dart';
import 'package:flutter_bakery_shop/screens/purple_screen.dart';
import 'package:flutter_bakery_shop/screens/red_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      home: const RedScreen(),
    );
  }
}
