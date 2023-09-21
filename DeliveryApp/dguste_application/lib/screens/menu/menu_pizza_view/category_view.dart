import 'package:dgust_aplication/controllers/pizza_menu_categoy_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/product_card.dart';

class CategoryView extends GetView<PizzaMenuCategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.listAllCategories().length,
      itemBuilder: (context, index) {
        var category = controller.categories[index];
        return ProductCard(
          name: category.name,
          description: category.description,
          onChanged: () => Get.toNamed('product_customize'),
        );
      },
    );
  }
}
