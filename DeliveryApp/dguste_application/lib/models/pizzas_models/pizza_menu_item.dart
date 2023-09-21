import 'package:dgust_aplication/models/generic/generic_menu_item_model.dart';

class PizzaMenuItem extends DescriptableMenuItem {
  late final int quantityPiece;
  late final int quantityFlavor;

  PizzaMenuItem({
    required super.id,
    required super.categoryId,
    required super.classification,
    required this.quantityPiece,
    required this.quantityFlavor,
    required super.description,
    required super.isAvailable,
  });

  static List<PizzaMenuItem> pizzaMenuItems = [
    PizzaMenuItem(
      id: 1,
      categoryId: 1,
      classification: "Pequeno (P)",
      quantityFlavor: 1,
      quantityPiece: 4,
      description: "Pizza 4 pdçs e 2 sabores",
      isAvailable: true,
    ),
    PizzaMenuItem(
      id: 2,
      categoryId: 1,
      classification: "Media (M)",
      quantityFlavor: 2,
      quantityPiece: 6,
      description: "Pizza 6 pdçs e 1 sabores",
      isAvailable: true,
    ),
    PizzaMenuItem(
      id: 3,
      categoryId: 2,
      classification: "Brotinho (B)",
      quantityFlavor: 1,
      quantityPiece: 4,
      description: "Pizza brotinho 1 sabor",
      isAvailable: true,
    ),
    PizzaMenuItem(
      id: 4,
      categoryId: 2,
      classification: "Pequena (P)",
      quantityFlavor: 1,
      quantityPiece: 4,
      description: "Pizza 4 pdçs e 1 sabores",
      isAvailable: true,
    ),
  ];
}
