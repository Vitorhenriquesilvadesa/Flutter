/*
 Acho que depois devemos trocar esse nome "Menu Item" para algo mais adequado  
*/
import 'package:flutter/foundation.dart';

import '../generic/generic_menu_item_model.dart';

class PizzaMenuItemModel extends DescriptableMenuItemModel {
  late final int quantityPiece;
  late final int quantityFlavor;
  late final double price;

  PizzaMenuItemModel(
      {required super.id,
      required super.categoryId,
      required super.variation,
      required this.quantityPiece,
      required this.quantityFlavor,
      required super.description,
      required this.price});

  static List<PizzaMenuItemModel> pizzaMenuItems = [
    PizzaMenuItemModel(
      id: 1,
      categoryId: 1,
      variation: "Pequeno (P)",
      quantityFlavor: 1,
      quantityPiece: 4,
      description: "Pizza 4 pdçs e 2 sabores",
      price: 35.00,
    ),
    PizzaMenuItemModel(
      id: 2,
      categoryId: 1,
      variation: "Media (M)",
      quantityFlavor: 2,
      quantityPiece: 6,
      description: "Pizza 6 pdçs e 1 sabores",
      price: 52.00,
    ),
    PizzaMenuItemModel(
      id: 3,
      categoryId: 2,
      variation: "Brotinho (B)",
      quantityFlavor: 1,
      quantityPiece: 4,
      description: "Pizza brotinho 1 sabor",
      price: 10.00,
    ),
    PizzaMenuItemModel(
      id: 4,
      categoryId: 2,
      variation: "Pequena (P)",
      quantityFlavor: 1,
      quantityPiece: 4,
      description: "Pizza 4 pdçs e 1 sabores",
      price: 35.00,
    ),
  ];
}

void main(List<String> args) {
  debugPrint(PizzaMenuItemModel.pizzaMenuItems.toString());
}
