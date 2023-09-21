import 'package:dgust_aplication/models/generic_category_model.dart';
import 'package:dgust_aplication/models/pizzas_models/classification_menu_item_model.dart';
import 'package:dgust_aplication/models/pizzas_models/edge_model.dart';
import 'package:dgust_aplication/models/pizzas_models/flavor_mode.dart';

class PizzaCategoryModel extends GenericCategory {
  late final List<Edge> edges;
  late final List<Flavor> flavors;

  PizzaCategoryModel()
      : super.create(name: '', id: 0, menuItems: null, description: "");

  PizzaCategoryModel.create(
      {required id,
      required name,
      required menuItems,
      required this.edges,
      description,
      required this.flavors})
      : super.create(
            name: name, id: id, menuItems: menuItems, description: description);
  static List<PizzaCategoryModel> categories = [
    PizzaCategoryModel.create(
        id: 1,
        name: "Pizzas de Sal",
        menuItems: PizzaMenuItem.pizzaMenuItems
            .where(
              (c) => c.categoryId == 1,
            )
            .toList(),
        edges: Edge.edges.where((edge) => edge.categoryId == 1).toList(),
        description: "Pizzas Personalizavel de 4, 6, 8 e 10",
        flavors: Flavor.flavors.where((flavor) => flavor.id == 1).toList()),
    PizzaCategoryModel.create(
        id: 2,
        name: "Pizzas de Doce",
        menuItems: PizzaMenuItem.pizzaMenuItems
            .where(
              (c) => c.categoryId == 2,
            )
            .toList(),
        edges: Edge.edges.where((edge) => edge.categoryId == 2).toList(),
        description: "Pizzas de Doce brotinho e pequena",
        flavors: Flavor.flavors.where((flavor) => flavor.id == 2).toList())
  ];

  List<PizzaMenuItem> getMenuItensPizza(int categoryId) {
    return PizzaMenuItem.pizzaMenuItems
        .where(
          (c) => c.categoryId == categoryId,
        )
        .toList();
  }

  List<Edge> getEdgeById(int categoryId) {
    return Edge.edges.where((edge) => edge.categoryId == categoryId).toList();
  }

  List<Flavor> getAllFlavors(categoryId) {
    return Flavor.flavors.where((flavor) => flavor.id == 2).toList();
  }
}
