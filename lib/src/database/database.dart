/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-26 12:49:26 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-27 00:27:01
 */
import 'package:moor_flutter/moor_flutter.dart';
import 'package:positioncollect/src/database/batiments/batimentConverter.dart';
import 'package:positioncollect/src/database/batiments/batimentDao.dart';
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
