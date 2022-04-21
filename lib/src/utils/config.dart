/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:02:55 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-21 21:03:13
 */
// ignore_for_file: constant_identifier_names

import 'package:positioncollect/src/core/app_environment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Configs {
  static late String apiUrl;
  static late String apiKey;
  static late String appName;
  static late String assetsUrl;
  static late String nominatimUrl;
  static late String mapboxAccessToken;
  static late AppEnvironment env;

  /// Initializes config variables base on environment passed in parameter
  static init({
    AppEnvironment env = AppEnvironment.dev,
  }) async {
    String filePath = ".env";
    if (env == AppEnvironment.prod) {
      filePath = ".env.prod";
    }
    if (env == AppEnvironment.staging) {
      filePath = ".env.staging";
    }
    await dotenv.load(fileName: filePath);
    Configs.apiUrl = dotenv.get("APIURL");
    Configs.apiKey = dotenv.get("APIKEY");
    Configs.appName = dotenv.get("APPNAME");
    Configs.assetsUrl = "https://service.geo.sm/var/www";
    Configs.nominatimUrl = "https://nominatim.openstreetmap.org";
    Configs.mapboxAccessToken =
        "pk.eyJ1IjoiZ2F1dHk5NiIsImEiOiJjanN4aDd2cG8wMmw3NDRwaDc2cnc2OXJwIn0.YRVVo-3FkQtfkMPH4lt2hw";
    Configs.env = env;
  }
}

const String apiUrl = "https://servicesdev.position.cm";
const String nominatimUrl = "https://nominatim.openstreetmap.org";
