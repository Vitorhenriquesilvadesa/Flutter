import 'package:dgust_aplication/controllers/pizza_menu_categoy_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

//Classe que usara o builder
class ProductCustomize extends GetView<PizzaMenuCategoryController> {
  // int categoId;
  // ProductCustomize({
  //   required this.categoId,
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dgust"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Apenas Visualizando Dados",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "tamanhos:",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Column(
            children: controller
                .getAllMenuIntensByCategory(1)
                .map((menuItem) => Text(menuItem.classification))
                .toList(),
          ),
          Text(
            "Bordas:",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Column(
            children: controller
                .getAllEdgesByCategory(1)
                .map(
                  (edges) => Column(
                    children: [
                      Text(edges.name),
                      Text("${edges.prices.first.price}")
                    ],
                  ),
                )
                .toList(),
          ),
          Text(
            "Sabores:",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Column(
            children: controller
                .getAllFlavorsByCategory(1)
                .map(
                  (flavor) => Text(flavor.name),
                )
                .toList(),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
