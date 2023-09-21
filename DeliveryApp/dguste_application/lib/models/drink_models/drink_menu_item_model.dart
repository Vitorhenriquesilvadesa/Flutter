import 'package:dgust_aplication/models/generic/generic_menu_item_model.dart';

class DrinkMenuItem extends NonDescriptableMenuItem {
  DrinkMenuItem({
    required super.id,
    required super.categoryId,
    required super.classification,
    required super.isAvailable,
  });
  static List<DrinkMenuItem> menuItems = [
    DrinkMenuItem(
      id: 1,
      categoryId: 2,
      classification: "Coca Cola lata",
      isAvailable: true,
    ),
    DrinkMenuItem(
      id: 2,
      categoryId: 2,
      classification: "Coca 2 lt",
      isAvailable: true,
    ),
    DrinkMenuItem(
      id: 3,
      categoryId: 2,
      classification: "Mineiro",
      isAvailable: true,
    ),
    DrinkMenuItem(
      id: 5,
      categoryId: 2,
      classification: "Fanta",
      isAvailable: true,
    ),
    DrinkMenuItem(
      id: 6,
      categoryId: 2,
      classification: "Guarana Antartica",
      isAvailable: true,
    ),
    DrinkMenuItem(
      id: 7,
      categoryId: 2,
      classification: "Fanta Uva",
      isAvailable: true,
    ),
    DrinkMenuItem(
      id: 8,
      categoryId: 2,
      classification: "Sprite",
      isAvailable: true,
    ),
  ];
}
