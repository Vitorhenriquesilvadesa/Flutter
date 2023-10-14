//Esse controller ira pegar a lista de categorias,
//e se houver outras operaçõs como:
// pegar por id,
//por nome
//e ate deletar a categoria e todas as categorias relacionadas
// Logo Logo ira separado em  controllers diferentes... para um generico
import 'package:dgust_aplication/repositories/pizza_repositories/pizza_category_repository.dart';
import 'package:get/get.dart';

import '../../models/pizzas_models/pizza_category_model.dart';

/*
 O Controller tera  uma Classe Repository de acordo para controlar as operações da model
*/

class PizzaCategoryController extends GetxController {
  final PizzaCategoryRepository repository;
  late List<PizzaCategoryModel> _categories = [];
  List<PizzaCategoryModel> get categories => _categories;

  PizzaCategoryController({required this.repository});

  // Assim onde tiver a variavel "_categories" apenas sera atualizado os valores!
  void listAllCategories() {
    _categories = [];
    _categories.addAll(repository.listAll());
    update();
  }

  /* 
    Não sei exatamente como funciona, depois a gente arruma.
  */
  // List<Identificable> getByCategory(ItemCategory category, int id) {
  //   if (category == ItemCategory.edge) {
  //     return model.getEdgeById(id);
  //   } else if (category == ItemCategory.flavor) {
  //     return model.getAllFlavors(id);
  //   } else if (category == ItemCategory.genericMenuItem) {
  //     return model.getMenuItensPizza(id);
  //   } else {
  //     throw NullRejectionException(false);
  //   }
  // }
}
