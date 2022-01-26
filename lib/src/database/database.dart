/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-26 12:49:26 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-26 22:09:15
 */
import 'package:moor_flutter/moor_flutter.dart';
import 'package:positioncollect/src/database/batiments/batimentConverter.dart';
import 'package:positioncollect/src/database/batiments/batimentTable.dart';
import 'package:positioncollect/src/models/batiments_model/datum.dart';

part 'database.g.dart';

@UseMoor(tables: [Batiments], daos: [BatimentsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(path: 'positioncollect.sqlite'),
        );

  @override
  int get schemaVersion => 1;
}

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
