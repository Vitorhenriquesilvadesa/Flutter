import 'package:instagram/pages/homepage/custom_widgets/body_container.dart';
import 'package:instagram/pages/homepage/custom_widgets/left_menu.dart';
import 'package:instagram/pages/homepage/custom_widgets/right_manu.dart';
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
      body: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 1280, minHeight: 720),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Row(
            children: [
              const LeftMenu(),
              //const VerticalDivider(width: 0.5),
              Expanded(
                flex: 1,
                child: Container(color: Colors.black),
              ),
              const BodyContainer(),
              const RightMenu(),
            ],
          ),
        ),
      ),
    );
  }
}
