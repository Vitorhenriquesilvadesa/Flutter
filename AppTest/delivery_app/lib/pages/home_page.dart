import 'package:delivery_app/pages/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/start_page_bg.jpg"),
              fit: BoxFit.cover),
        ),
        child: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Column(children: [
            Container(
              height: 32,
              decoration: BoxDecoration(color: AppColors.mainColor),
            )
          ]),
        ),
      ),
    );
  }
}
