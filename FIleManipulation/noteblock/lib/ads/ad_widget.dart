import 'package:flutter/material.dart';

import 'ad.dart';

// ignore: must_be_immutable
class AdWidget extends StatelessWidget {
  late String title;
  late String price;
  late String description;

  AdWidget.pickFrom(Ad ad, {super.key}) {
    title = ad.title;
    price = ad.price.toString();
    description = ad.description;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 320, maxHeight: 800),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: 10,
        height: 400,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 50, 50, 50),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 20, 20, 20),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              height: 280,
              width: 300,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
