import 'package:dgust_aplication/models/pizzas_models/pizza_menu_item.dart';
import 'package:dgust_aplication/repositories/generic/generic_repository.dart';

class PizzaMenuItemRepository extends GenericRepository<PizzaMenuItemModel> {
  PizzaMenuItemRepository()
      : super.setList(testList: PizzaMenuItemModel.pizzaMenuItems);
}
