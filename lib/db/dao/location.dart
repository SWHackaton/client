import 'dart:async';

import 'package:mockup/db/dto/location.dart';
import 'package:sqflite/sqflite.dart';

class GeoLocationProvider {
  late Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
              CREATE TABLE $tableGeo(
                $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
                $columnDateTime TEXT NOT NULL,
                $columnLat REAL NOT NULL,
                $columnLon REAL NOT NULL
              );
          ''');
        });
  }

  Future<GeoLocation> insert(GeoLocation location) async {
    location.id = await db.insert(tableGeo, location.toMap());
    return location;
  }

  Future<dynamic> get(int id) async {
    List<Map> maps = await db.query(tableGeo,
        columns: [columnId, columnDateTime, columnLat, columnLon],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return GeoLocation.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableGeo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(GeoLocation location) async {
    return await db.update(tableGeo, location.toMap(),
        where: '$columnId = ?', whereArgs: [location.id]);
  }

  Future close() async => db.close();
}