import 'package:flutter/material.dart';
import 'package:mercado_livre_2/controller/general/appearence.dart';

class AdDescriptor extends StatelessWidget {
  String name;
  List<String> attributes;
  double price;
  double cardWidth;
  double cardHeight;

  AdDescriptor(
      this.name, this.attributes, this.price, this.cardWidth, this.cardHeight,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Appearence.getData(JuiceThemeData.secondaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      width: cardWidth,
      height: cardHeight,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: cardWidth - 20,
            height: cardWidth - 120,
            decoration: BoxDecoration(
              color: Appearence.getData(JuiceThemeData.backgroundColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:
                            Appearence.getData(JuiceThemeData.backgroundColor),
                      ),
                      width: 280,
                      height: 30,
                      child: Center(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 20,
                            color: Appearence.getData(JuiceThemeData.textColor),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: Text(
                        "R\$${price.toStringAsPrecision(2)}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Appearence.getData(JuiceThemeData.textColor),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        attributes[0],
                        style: TextStyle(
                          fontSize: 20,
                          color: Appearence.getData(JuiceThemeData.textColor),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
