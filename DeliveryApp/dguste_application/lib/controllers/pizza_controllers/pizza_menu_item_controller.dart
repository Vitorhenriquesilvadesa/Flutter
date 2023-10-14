import 'package:dgust_aplication/repositories/pizza_repositories/pizza_menu_item_repository.dart';
import 'package:get/get.dart';
import '../../models/pizzas_models/pizza_menu_item.dart';

/*
 O Controller tera  uma Classe Repository de acordo para controlar as operações da model
*/

class PizzaMenuItemController extends GetxController {
  final PizzaMenuItemRepository repository;
  late List<PizzaMenuItemModel> _menuItens = [];
  List<PizzaMenuItemModel> get menuItens => _menuItens;

  PizzaMenuItemController({required this.repository});
  // ListAllMenuItens() {
  //   _menuItens = [];
  //   _menuItens.addAll(repository.listAll());
  //   update();
  // }

  listAllMenuItens(int categoryId) {
    _menuItens = [];
    _menuItens.addAll(repository.getByCategoryId(categoryId));
    update();
  }
}
