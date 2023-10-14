import 'package:dgust_aplication/models/pizza_parts_models/flavor_model.dart';
import 'package:dgust_aplication/models/pizzas_models/pizza_category_model.dart';
import 'package:dgust_aplication/models/pizzas_models/pizza_menu_item.dart';

class PizzaBuilder {
  late Pizza pizza = Pizza();

  setCategory(PizzaCategoryModel category) {
    pizza.category = category;
  }

  setMenuItem(PizzaMenuItemModel menuItem) {
    pizza.menuItem = menuItem;
  }

  setFlavor(FlavorModel flavor) {
    pizza.flavor = flavor;
  }

  build() {
    return pizza;
  }
}

class Pizza {
  late PizzaCategoryModel _category;
  set category(PizzaCategoryModel category) => _category = category;

  late PizzaMenuItemModel _menuItem;
  set menuItem(PizzaMenuItemModel menuItem) => _menuItem = menuItem;
  // late EdgeModel _edge;
  late FlavorModel _flavor;
  set flavor(FlavorModel flavor) => _flavor = flavor;
  late double _price;

  get price {
    _price = _menuItem.price;
    return _price;
  }

  @override
  String toString() {
    return "category = ${_category.name}\ntamanho = ${_menuItem.name} \nflavor = ${_flavor.name}\npreço = $price";
  }
}
