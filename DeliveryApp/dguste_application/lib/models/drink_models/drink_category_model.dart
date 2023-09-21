import 'package:dgust_aplication/models/generic/generic_category_model.dart';

import 'drink_menu_item_model.dart';

class DrinkCategoryModel extends GenericCategory {
  DrinkCategoryModel()
      : super.create(name: '', id: 0, menuItems: null, description: "");

  DrinkCategoryModel.create({required name, required id, required menuItems})
      : super.create(name: name, id: id, menuItems: menuItems, description: "");

  static List<DrinkCategoryModel> categories = [
    DrinkCategoryModel.create(
        name: "Bebidas",
        id: 2,
        menuItems: DrinkMenuItem.menuItems
            .where((menuItem) => menuItem.categoryId == 2)
            .toList()),
  ];
}
