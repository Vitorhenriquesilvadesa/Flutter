import 'package:flutter/material.dart';

import 'body_menu_screen.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dgust"),
        leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => debugPrint('Menu')),
        actions: [
          IconButton(
              onPressed: () => debugPrint("Cart"),
              icon: const Icon(Icons.shopping_cart, color: Colors.white)),
        ],
      ),
      body: const Body(),
      // bottomNavigationBar:BottomAppBar(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         style: ElevatedButton.styleFrom(
      //           backgroundColor: Theme.of(context).primaryColor,
      //           shape: RoundedRectangleBorder(),
      //           padding: EdgeInsets.symmetric(horizontal: 40)
      //           ),

      //         onPressed: () => debugPrint("Confimar Pedido"),
      //         child: Text("Confirmar")),
      //     ],
      //   ),
      // ) ,
    );
  }
}
