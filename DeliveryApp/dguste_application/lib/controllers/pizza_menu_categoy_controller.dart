import 'package:dgust_aplication/models/pizzas_models/edge_model.dart';
import 'package:dgust_aplication/models/pizzas_models/flavor_mode.dart';
import 'package:flutter/src/foundation/key.dart';

import '../models/generic_menu_item_model.dart';
import '../models/pizzas_models/category_pizza_model.dart';
import 'package:get/get.dart';

class PizzaMenuCategoryController extends GetxController{
  

  PizzaCategoryModel model;

  PizzaMenuCategoryController({Key? key}): model = PizzaCategoryModel();

  RxList<PizzaCategoryModel> categories = <PizzaCategoryModel>[].obs;

   void onInit() {
    super.onInit();
    categories.addAll(listAllCategories()); 
  }


  List<PizzaCategoryModel> listAllCategories(){
    return PizzaCategoryModel.categories; // Porcaria resolver
  }

  List<Edge> getAllEdgesByCategory(int categoryId){
    return model.getEdgeById(categoryId);
  }

  // GENERICA
  List<GenericMenuItem> getAllMenuIntensByCategory(int categoryId){
    return model.getMenuItensPizza(categoryId);
  }
  List<Flavor> getAllFlavorsByCategory(int categoryId){
    return model.getAllFlavors(categoryId);
  }


  
}