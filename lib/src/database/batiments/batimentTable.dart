/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-26 12:49:32 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-26 21:53:01
 */
// ignore_for_file: file_names

import 'package:moor_flutter/moor_flutter.dart';
import 'package:positioncollect/src/database/batiments/batimentConverter.dart';

class Batiments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get batiment => text().map(const BatimentConverter()).nullable()();
}
