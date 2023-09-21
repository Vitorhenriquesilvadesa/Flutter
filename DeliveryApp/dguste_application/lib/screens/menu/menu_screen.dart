import 'package:flutter/material.dart';

import 'body.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Dgust"),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white,),
          onPressed: () => debugPrint('Menu')),
          actions: [IconButton(
            onPressed: () => debugPrint("Cart"),
            icon: Icon(Icons.shopping_cart, color: Colors.white)),
            ],
            
          ),
          body: Body(),
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