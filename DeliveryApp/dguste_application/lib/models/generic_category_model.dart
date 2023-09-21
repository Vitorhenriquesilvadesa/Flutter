import 'package:dgust_aplication/models/pizzas_models/category_pizza_model.dart';

import 'generic_menu_item_model.dart';

abstract class GenericCategory {
  int id;
  String name;
  // late Image image;
  List<GenericMenuItem>? menuItems; //alterar
  String description;

  static List<GenericCategory> categories =
      List.of(PizzaCategoryModel.categories);

  GenericCategory.create(
      {required this.name,
      required this.id,
      required this.menuItems,
      required this.description});
}
