import 'package:flutter/material.dart';
import 'package:noteblock/ads/ad.dart';
import 'package:sqflite/sqflite.dart';
import 'data_base_helper.dart';
import 'iad.dart';

class AdHelper implements IAd {
  static const String databaseName = "ad";
  static const String tableName = "ads";
  static const String idColumn = "id";
  static const String titleColumn = "title";
  static const String descriptionColumn = "description";
  static const String priceColumn = "price";
  static const String imageColumn = "image";

  static get createScript {
    return "CREATE TABLE $tableName($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, "
        "$titleColumn TEXT NOT NULL, $priceColumn TEXT NOT NULL, $descriptionColumn TEXT NOT NULL, "
        "$imageColumn TEXT NOT NULL);";
  }

  @override
  Future<Ad?> save(Ad ad) async {
    Database? db = await DatabaseHelper().db;
    if (db != null) {
      try {
        await db.transaction((txn) async {
          ad.id = await txn.insert(tableName, ad.toMap());
        });

        debugPrint("Anuncio salvo com sucesso");
        return ad;
      } catch (e) {
        debugPrint("Erro ao salvar anúncio: $e");
      }
    }
    return null;
  }

  @override
  Future<int?> delete(Ad ad) async {
    Database? db = await DatabaseHelper().db;
    if (db != null) {
      debugPrint("Deleting ad with: id = ${ad.id}");
      return await db.delete(tableName, where: "id=?", whereArgs: [ad.id]);
    }
    return null;
  }

  @override
  Future<int?> edit(Ad ad) async {
    Database? db = await DatabaseHelper().db;
    if (db != null) {
      return await db
          .update(tableName, ad.toMap(), where: "id=?", whereArgs: [ad.id]);
    }
    return null;
  }

  @override
  Future<List<Ad>> getAll() async {
    Database? db = await DatabaseHelper().db;
    List<Ad> ads = List.empty(growable: true);
    if (db != null) {
      List<Map> returnedAds = await db.query(tableName);

      for (Map mAd in returnedAds) {
        Ad item = Ad.fromMap(mAd);

        debugPrint(item.toString());
        ads.add(item);
      }
    }
    return ads;
  }

  @override
  Future<Ad?> getById(int id) async {
    Database? db = await DatabaseHelper().db;
    if (db != null) {
      List<Map> returnedAd = await db.query(tableName,
          columns: [
            idColumn,
            imageColumn,
            titleColumn,
            priceColumn,
            descriptionColumn,
          ],
          where: "id=?",
          whereArgs: [id]);

      return Ad.fromMap(returnedAd.first);
    }
    return null;
  }
}
