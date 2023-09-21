import 'package:dgust_aplication/controllers/pizza_menu_categoy_controller.dart';
import 'package:get/get.dart';

class PizzaMenuCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PizzaMenuCategoryController>(
      () => PizzaMenuCategoryController(),
    );
  }
}
