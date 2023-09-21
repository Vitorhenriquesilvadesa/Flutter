class EdgePrice {
  final int idEdge; // Selecionar por esse cara
  final int idPizzaMenuItem;
  final double price;

  EdgePrice({
    required this.idEdge,
    required this.idPizzaMenuItem,
    required this.price,
  });

  static List<EdgePrice> edgesPrices = [
    EdgePrice(idPizzaMenuItem: 1, idEdge: 1, price: 5),
    EdgePrice(idPizzaMenuItem: 2, idEdge: 1, price: 10),
    EdgePrice(idPizzaMenuItem: 1, idEdge: 2, price: 5),
    EdgePrice(idPizzaMenuItem: 2, idEdge: 2, price: 10)
    //
    ,
    EdgePrice(idPizzaMenuItem: 3, idEdge: 3, price: 0.0),
    EdgePrice(idPizzaMenuItem: 4, idEdge: 3, price: 5.0),
    EdgePrice(idPizzaMenuItem: 3, idEdge: 4, price: 0.0),
    EdgePrice(idPizzaMenuItem: 4, idEdge: 4, price: 5.0)
  ];
}
