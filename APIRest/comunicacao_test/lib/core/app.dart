import 'package:instagram/pages/homepage/home_page.dart';
import 'package:flutter/material.dart';

class APIRestApp extends StatelessWidget {
  const APIRestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
