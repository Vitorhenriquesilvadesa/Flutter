import 'package:dgust_aplication/controllers/pizza_controllers/flavor_controller.dart';
import 'package:dgust_aplication/controllers/pizza_controllers/pizza_category_controller.dart';
import 'package:dgust_aplication/controllers/pizza_controllers/pizza_menu_item_controller.dart';
import 'package:dgust_aplication/repositories/pizza_repositories/flavor_repository.dart';
import 'package:dgust_aplication/repositories/pizza_repositories/pizza_category_repository.dart';
import 'package:dgust_aplication/repositories/pizza_repositories/pizza_menu_item_repository.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => PizzaCategoryRepository());
  Get.lazyPut(() => PizzaMenuItemRepository());
  Get.lazyPut(() => FlavorRepository());

  Get.lazyPut(() => PizzaCategoryController(repository: Get.find()));
  Get.lazyPut(() => PizzaMenuItemController(repository: Get.find()));
  Get.lazyPut(() => FlavorController(repository: Get.find()));
}
