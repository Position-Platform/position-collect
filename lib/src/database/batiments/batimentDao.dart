// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-27 00:24:37 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-27 00:35:27
 */

import 'package:moor_flutter/moor_flutter.dart';
import 'package:positioncollect/src/database/batiments/batimentTable.dart';
import 'package:positioncollect/src/database/database.dart';

part 'batimentDao.g.dart';

@UseDao(tables: [Batiments])
class BatimentsDao extends DatabaseAccessor<AppDatabase>
    with _$BatimentsDaoMixin {
  final AppDatabase db;

  BatimentsDao(this.db) : super(db);

  Future<List<Batiment>> getBatiments() => select(batiments).get();

  Future insertBatiment(Insertable<Batiment> batiment) =>
      into(batiments).insertOnConflictUpdate(batiment);

  Future deleteBatiment(Batiment batiment) =>
      delete(batiments).delete(batiment);

  Future<Batiment> getHousebyId(int id) {
    return (select(batiments)..where((t) => t.id.equals(id))).getSingle();
  }
}
