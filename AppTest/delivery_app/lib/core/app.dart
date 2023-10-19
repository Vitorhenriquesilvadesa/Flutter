import 'package:delivery_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'FoodFy'),
    );
  }
}
