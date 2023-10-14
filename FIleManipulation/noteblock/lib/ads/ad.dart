import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:noteblock/database/ad_helper.dart';

class Ad {
  late int? id;
  late String title;
  late String price;
  late String description;
  late Image? image;
  late String? imagePath;

  Ad(this.title, this.price, this.description, this.imagePath, {this.id}) {
    image = Image.file(File(imagePath!));
  }

  Ad.fromMap(Map map) {
    id = map[AdHelper.idColumn];
    imagePath = map[AdHelper.imageColumn];
    title = map[AdHelper.titleColumn];
    price = map[AdHelper.priceColumn].toString();
    description = map[AdHelper.descriptionColumn];

    image = Image.file(File(imagePath!));
  }

  @override
  String toString() {
    return "{ id: $id, title: $title, price: $price, description: $description, image: $imagePath}";
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      AdHelper.idColumn: id,
      AdHelper.titleColumn: title,
      AdHelper.priceColumn: price,
      AdHelper.descriptionColumn: description,
      AdHelper.imageColumn: imagePath,
    };

    return map;
  }
}
