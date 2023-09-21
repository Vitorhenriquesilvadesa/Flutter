import 'dart:js_util';

import 'package:dgust_aplication/controllers/general_id.dart';
import 'package:flutter/material.dart';
import '../models/generic/generic_menu_item_model.dart';
import '../models/pizza_parts_models/edge_model.dart';
import '../models/pizza_parts_models/flavor_model.dart';
import '../models/pizzas_models/pizza_category_model.dart';
import 'package:get/get.dart';

class PizzaMenuCategoryController extends GetxController {
  PizzaCategoryModel model;

  PizzaMenuCategoryController({Key? key}) : model = PizzaCategoryModel();

  RxList<PizzaCategoryModel> categories = <PizzaCategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    categories.addAll(listAllCategories());
  }

  List<PizzaCategoryModel> listAllCategories() {
    return PizzaCategoryModel.categories; // Porcaria resolver
  }

  List<Identificable> getByCategory(ItemCategory category, int id) {
    if (category == ItemCategory.edge) {
      return model.getEdgeById(id);
    } else if (category == ItemCategory.flavor) {
      return model.getAllFlavors(id);
    } else if (category == ItemCategory.genericMenuItem) {
      return model.getMenuItensPizza(id);
    } else {
      throw NullRejectionException(false);
    }
  }

  List<Edge> getAllEdgesByCategory(int categoryId) {
    return model.getEdgeById(categoryId);
  }

  // GENERICA
  List<GenericMenuItem> getAllMenuIntensByCategory(int categoryId) {
    return model.getMenuItensPizza(categoryId);
  }

  List<Flavor> getAllFlavorsByCategory(int categoryId) {
    return model.getAllFlavors(categoryId);
  }
}

enum ItemCategory {
  edge,
  genericMenuItem,
  flavor,
}
