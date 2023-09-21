import 'package:dgust_aplication/models/generic_menu_item_model.dart';

class PizzaMenuItem extends GenericMenuItem {
  late final int quantityPiece;
  late final int quantityFlavor;

  PizzaMenuItem(
      {required super.id,
      required super.categoryId,
      required super.classification,
      required this.quantityPiece,
      required this.quantityFlavor,
      required super.description});

  // PizzaMenuItem({required this.classSize, required this.quantityPiece, required this.quantityFlavor}) : super(super.id , categoryId: 0, name: '', price: 0.0, description: '');

  static List<PizzaMenuItem> pizzaMenuItems = [
    PizzaMenuItem(
        id: 1,
        categoryId: 1,
        classification: "Pequeno (P)",
        quantityFlavor: 1,
        quantityPiece: 4,
        description: "Pizza 4 pdçs e 2 sabores"),
    PizzaMenuItem(
        id: 2,
        categoryId: 1,
        classification: "Media (M)",
        quantityFlavor: 2,
        quantityPiece: 6,
        description: "Pizza 6 pdçs e 1 sabores"),
    PizzaMenuItem(
        id: 3,
        categoryId: 2,
        classification: "Brotinho (B)",
        quantityFlavor: 1,
        quantityPiece: 4,
        description: "Pizza brotinho 1 sabor"),
    PizzaMenuItem(
        id: 4,
        categoryId: 2,
        classification: "Pequena (P)",
        quantityFlavor: 1,
        quantityPiece: 4,
        description: "Pizza 4 pdçs e 1 sabores"),
  ];
}
