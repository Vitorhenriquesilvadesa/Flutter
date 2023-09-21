import 'package:dgust_aplication/bindings/PizzaMenuCategoryBinding.dart';
import 'package:dgust_aplication/screens/menu/menu_pizza_view/product_customize.dart';
import 'package:dgust_aplication/screens/menu/menu_screen.dart';
import 'package:dgust_aplication/screens/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  GetMaterialApp build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dguste Demo',
      theme: theme(),
      home: const MenuScreen(),
      initialRoute: '/home',
      getPages: [
        //Simple GetPage
        GetPage(
          name: '/home',
          page: () => const MenuScreen(),
          binding: PizzaMenuCategoryBinding(),
        ),
        GetPage(
          name: '/product_customize',
          page: () => ProductCustomize(),
          // binding: SampleBind()
        ),
        // GetPage with default transitions
      ],
    );
  }
}
