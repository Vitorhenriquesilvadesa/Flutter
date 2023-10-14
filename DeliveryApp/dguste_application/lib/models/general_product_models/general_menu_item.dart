import '../generic/generic_menu_item_model.dart';

class GeneralMenuItem extends NonDescriptableMenuItemModel {
  GeneralMenuItem(
      {required super.id, required super.categoryId, required super.variation});
  static List<GeneralMenuItem> menuItems = [
    GeneralMenuItem(
      id: 1,
      categoryId: 3,
      variation: "Balinha",
    ),
    GeneralMenuItem(
      id: 2,
      categoryId: 3,
      variation: "Halss",
    ),
  ];
}
