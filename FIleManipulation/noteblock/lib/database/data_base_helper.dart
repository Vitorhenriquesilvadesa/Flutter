import 'package:flutter/material.dart';
import 'package:noteblock/database/ad_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  Database? _db;

  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
      return _db;
    }
  }

  Future<Database?> initDB() async {
    final path = await fullpath;

    try {
      return _db = await openDatabase(
        path,
        version: 2,
        onCreate: _onCreateDB,
        onUpgrade: _onUpgradeDB,
        singleInstance: true,
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future _onCreateDB(Database db, int version) async {
    await db.execute(AdHelper.createScript);
  }

  Future _onUpgradeDB(Database db, int oldVersion, int newVersion) async {
    await db.execute("DROP TABLE ${AdHelper.tableName}");
    await _onCreateDB(db, newVersion);
    debugPrint("Banco de dados atualizado.");
  }

  Future<String> get fullpath async {
    const name = "${AdHelper.databaseName}.db";
    final path = await getDatabasesPath();
    return join(path, name);
  }
}
