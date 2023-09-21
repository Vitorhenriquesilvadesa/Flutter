import 'package:dgust_aplication/models/generic_category_model.dart';

import 'menu_item_model.dart';

class ProductCategoryModel extends GenericCategory{ //Equatablle

ProductCategoryModel(): super.create(name: '', id: 0, menuItems: null, description: "");


  ProductCategoryModel.create({required name, required id, required menuItems}) : super.create(name: name, id: id, menuItems: menuItems, description: "");

  static List<ProductCategoryModel> categories = [
    ProductCategoryModel.create(name: "Bebidas", id:2, menuItems: ProductMenuItem.menuItems.where((menuItem) => menuItem.categoryId == 2).toList()),
    ];




     
}