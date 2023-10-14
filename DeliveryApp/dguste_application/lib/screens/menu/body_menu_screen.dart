import 'package:dgust_aplication/controllers/pizza_controllers/flavor_controller.dart';
import 'package:dgust_aplication/controllers/pizza_controllers/pizza_category_controller.dart';
import 'package:dgust_aplication/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/pizza_controllers/pizza_menu_item_controller.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          GetBuilder<PizzaCategoryController>(
            builder: (pizzaCategories) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pizzas",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: buildCartCategory(pizzaCategories),
                    ), // Poderia pegar essa info categoria tbm! ou de ums costante
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  GridView buildCartCategory(PizzaCategoryController pizzaCategories) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        shrinkWrap: true,
        itemCount: pizzaCategories.categories.length,
        itemBuilder: (context, index) {
          // trocar nome desse componente
          var category = pizzaCategories.categories[index];
          return GestureDetector(
            onTap: () {
              Get.find<PizzaMenuItemController>().listAllMenuItens(category.id);
              Get.find<FlavorController>().listAllFlavors(category.id);
              Get.toNamed(RouteHelper.getPizzaCustomizeDetails(index));
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    category.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          );
        });
  }
}
