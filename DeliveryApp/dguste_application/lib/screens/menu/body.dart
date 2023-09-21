import 'package:flutter/material.dart';

import 'menu_pizza_view/category_view.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: TabBar(
              tabs: [
                // VOU RESOLVER ISSO AQUI, MAIS ELEGANCIA NE RAPAZ
                Tab(text: 'Pizza'),
                Tab(text: 'Produtos'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Conteúdo da Tab 1
                CategoryView(),
                // Conteúdo da Tab 2
                Center(
                  child: Text('Conteúdo da Tab 2'),
                ),
                // Conteúdo da Tab 3
              ],
            ),
          ),
        ],
      ),
    );
  }
}
