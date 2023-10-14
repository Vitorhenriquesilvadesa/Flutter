import 'package:dgust_aplication/models/pizza_parts_models/flavor_model.dart';
import 'package:dgust_aplication/repositories/pizza_repositories/flavor_repository.dart';
import 'package:get/get.dart';

/*
 O Controller tera  uma Classe Repository de acordo para controlar as operações da model
*/

class FlavorController extends GetxController {
  final FlavorRepository repository;
  late List<FlavorModel> _flavors = [];
  List<FlavorModel> get flavors => _flavors;

  FlavorController({required this.repository});
  // ListAllMenuItens() {
  //   _menuItens = [];
  //   _menuItens.addAll(repository.listAll());
  //   update();
  // }

  void listAllFlavors(int categoryId) {
    _flavors = [];
    _flavors.addAll(repository.getByCategoryId(categoryId));
    update();
  }
}
