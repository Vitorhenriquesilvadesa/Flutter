import 'package:dgust_aplication/builder/pizza_builder.dart';
import 'package:dgust_aplication/controllers/pizza_controllers/flavor_controller.dart';
import 'package:dgust_aplication/controllers/pizza_controllers/pizza_category_controller.dart';
import 'package:dgust_aplication/controllers/pizza_controllers/pizza_menu_item_controller.dart';
import 'package:dgust_aplication/screens/menu/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PizzaCustomizeDetails extends StatefulWidget {
  final int pageId;
  const PizzaCustomizeDetails({super.key, required this.pageId});

  //Apenas tentando o Builder, PROVISORIO

  @override
  State<PizzaCustomizeDetails> createState() => _PizzaCustomizeDetailsState();
}

class _PizzaCustomizeDetailsState extends State<PizzaCustomizeDetails> {
  PizzaBuilder builder = PizzaBuilder();
  @override
  Widget build(BuildContext context) {
    var category =
        Get.find<PizzaCategoryController>().categories[widget.pageId];
    builder.setCategory(category);

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: const RoundedRectangleBorder(),
                    padding: const EdgeInsets.symmetric(horizontal: 40)),
                onPressed: () {
                  Pizza pizza = builder.build();
                  debugPrint(pizza.toString());
                },
                child: const Text("Confirmar")),
          ],
        ),
      ),
      body: Column(
        children: [
          Text(category.name, style: Theme.of(context).textTheme.titleLarge),
          GetBuilder<PizzaMenuItemController>(
            builder: (menuItensController) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: menuItensController.menuItens.length,
                itemBuilder: (context, index) {
                  // trocar nome desse componente
                  var menuItem = menuItensController.menuItens[index];
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: const RoundedRectangleBorder(),
                          padding: const EdgeInsets.symmetric(horizontal: 40)),
                      onPressed: () {
                        builder.setMenuItem(menuItem);
                      },
                      child: Text("${menuItem.name} ${menuItem.price}"));
                },
              );
            },
          ),
          GetBuilder<FlavorController>(
            builder: (flavorController) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: flavorController.flavors.length,
                itemBuilder: (context, index) {
                  // trocar nome desse componente
                  var flavor = flavorController.flavors[index];
                  // Card Provisorio
                  return ProductCard(
                    name: flavor.name,
                    description: flavor.description,
                    onChanged: () => builder.setFlavor(flavor),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
