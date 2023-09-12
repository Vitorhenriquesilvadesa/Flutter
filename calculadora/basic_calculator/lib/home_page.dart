import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Demo', home: HomePage(title: 'Flutter Demo Home Page'));
  }

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
