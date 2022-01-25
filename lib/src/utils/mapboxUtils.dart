/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-24 13:36:42 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-24 13:36:42 
 */
// ignore_for_file: file_names, constant_identifier_names

import 'package:mapbox_gl/mapbox_gl.dart';

const String GEOJSON_SOURCE_ID = "geojson-source-id";
const String UNCLUSTERED_POINTS = "unclustered-points";

List<dynamic> mapThemes = [
  {
    'name': 'Dark',
    'style': MapboxStyles.DARK,
    'image': 'assets/images/osm_dark.png'
  },
  {
    'name': 'Street',
    'style': MapboxStyles.MAPBOX_STREETS,
    'image': 'assets/images/mapbox_street.png'
  },
  {
    'name': 'Satellite',
    'style': MapboxStyles.SATELLITE,
    'image': 'assets/images/mapbox_satellite.png'
  },
];
