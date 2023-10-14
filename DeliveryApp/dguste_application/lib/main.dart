import 'package:dgust_aplication/controllers/pizza_controllers/pizza_category_controller.dart';
import 'package:dgust_aplication/routes/route_helper.dart';
import 'package:dgust_aplication/screens/menu/main_menu_screen.dart';
import 'package:dgust_aplication/screens/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  GetMaterialApp build(BuildContext context) {
    Get.find<PizzaCategoryController>().listAllCategories();
    return GetMaterialApp(
      title: 'Dguste Demo',
      theme: theme(),
      home: const MainMenu(),
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}
