
import 'package:dgust_aplication/models/pizzas_models/edge_price.dart';

class Edge {
  late final int id; 
  late final int categoryId;
  late final String name;
  late final List<EdgePrice> prices; 
  Edge({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.prices
  });
  static List<Edge> edges = [
    Edge(id: 1, categoryId: 1, name: "Cheddar", 
    prices: EdgePrice.edgesPrices.where((edgePrice) => edgePrice.idEdge == 1).toList()),
    Edge(id: 2, categoryId: 1, name: "Chocolate", 
    prices: EdgePrice.edgesPrices.where((edgePrice) => edgePrice.idEdge == 2).toList() ),
    Edge(id: 3, categoryId: 2, name: "Chocolate", 
    prices: EdgePrice.edgesPrices.where((edgePrice) => edgePrice.idEdge == 1).toList()),
    Edge(id: 4, categoryId: 2, name: "Chocolate Branco", 
    prices: EdgePrice.edgesPrices.where((edgePrice) => edgePrice.idEdge == 2).toList() ),
    ];
  
  
}

