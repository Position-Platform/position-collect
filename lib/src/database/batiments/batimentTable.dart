/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-26 12:49:32 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-26 13:05:07
 */
// ignore_for_file: file_names

import 'package:moor_flutter/moor_flutter.dart';

class Batiments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get geojson => text().named('geojson')();
  IntColumn get nombreBatiment => integer().withDefault(const Constant(0))();
}
