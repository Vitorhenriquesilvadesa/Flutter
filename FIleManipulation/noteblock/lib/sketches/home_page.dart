import 'package:flutter/material.dart';

import 'editor/editor_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(20, 20, 27, 1),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 10,
                color: const Color.fromRGBO(20, 20, 25, 1),
              ),
              const EditorBody(),
            ],
          ),
        ),
      ),
    );
  }
}
