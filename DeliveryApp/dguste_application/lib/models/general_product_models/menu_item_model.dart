import 'package:dgust_aplication/models/generic_menu_item_model.dart';

class ProductMenuItem extends GenericMenuItem{

ProductMenuItem({required super.id, required super.categoryId, required super.classification, required super.description});
static List<ProductMenuItem> menuItems = [
    ProductMenuItem(id: 1, categoryId: 2, classification: "Coca Cola", description: "E Coca man"),
    ProductMenuItem(id: 2, categoryId: 2, classification: "Pepsi", description: "Refri man"),
    ProductMenuItem(id: 3, categoryId: 2, classification: "Mineiro", description: "Refri man",),
    ProductMenuItem(id: 5, categoryId: 2, classification: "Fanta", description: "E Refri man"),
    ProductMenuItem(id: 6, categoryId: 2, classification: "Guarana Antartica", description: "E Refri man"),
    ProductMenuItem(id: 7, categoryId: 2, classification: "Fanta Uva", description: "E Refri man"),
    ProductMenuItem(id: 8, categoryId: 2, classification: "Sprite", description: "E Refri man"),

  ];

  
}