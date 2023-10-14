import 'package:dgust_aplication/models/generic/generic_menu_item_model.dart';

class DrinkMenuItem extends NonDescriptableMenuItemModel {
  DrinkMenuItem(
      {required super.id, required super.categoryId, required super.variation});
  static List<DrinkMenuItem> menuItems = [
    DrinkMenuItem(
      id: 1,
      categoryId: 4,
      variation: "Coca Cola lata",
    ),
    DrinkMenuItem(
      id: 2,
      categoryId: 4,
      variation: "Coca 2 lt",
    ),
  ];
}
