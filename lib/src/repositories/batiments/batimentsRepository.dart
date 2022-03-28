// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:40:24 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-28 21:35:30
 */

import 'package:positioncollect/src/models/batiment_model/batiment_model.dart';
import 'package:positioncollect/src/models/batiment_model/data.dart';
import 'package:positioncollect/src/models/batiments_model/batiments_model.dart';
import 'package:positioncollect/src/models/sous_categories_model/sous_categories_model.dart';
import 'package:positioncollect/src/utils/result.dart';

abstract class BatimentsRepository {
  Future<Result<BatimentsModel>> getBatiments();

  Future<Result<BatimentModel>> getBatimentsById(int idBatiment);

  Future<Result<BatimentModel>> addBatiment(Data batiment, String imagePath);

  Future<Result<SousCategoriesModel>> getSousCategories();
}
