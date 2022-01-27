// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-26 21:40:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-26 21:42:02
 */
import 'dart:convert';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:positioncollect/src/models/batiments_model/datum.dart';

class BatimentConverter extends TypeConverter<Datum, String> {
  const BatimentConverter();
  @override
  Datum? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Datum.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String? mapToSql(Datum? value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
