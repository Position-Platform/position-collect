/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-24 13:36:42 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 00:31:30
 */
// ignore_for_file: file_names, constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/src/models/batiments_model/datum.dart';

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

Map<String, Object> createGeoJsonBatiments(List<Datum>? data) {
  var responses = [];

  for (var i = 0; i < data!.length; i++) {
    var element = data[i];
    var geometry = {
      "type": "Point",
      "coordinates": [element.longitude, element.latitude],
    };

    var properties = {
      "id": element.id,
      "nom": element.nom,
      "nombreNiveau": element.nombreNiveaux,
      "codeBatiment": element.codeBatiment,
      "image": element.image,
      "rue": element.rue,
      "ville": element.ville,
      "commune": element.commune,
      "quartier": element.quartier,
      "created_at": element.createdAt,
      "etablissements":
          element.etablissements?.map((i) => json.encode(i)).toList(),
    };

    responses.add({
      "type": 'Feature',
      "geometry": geometry,
      "properties": properties,
    });
  }

  var geojson = {
    "type": 'FeatureCollection',
    "features": responses,
  };

  return geojson;
}

addGeoJsonInmap(
    MapboxMapController? mapController, Map<String, Object> geojson) {
  mapController?.addSource(
      GEOJSON_SOURCE_ID,
      GeojsonSourceProperties(
          data: geojson, cluster: true, clusterMaxZoom: 16, clusterRadius: 50));
  mapController?.addLayer(
      GEOJSON_SOURCE_ID,
      UNCLUSTERED_POINTS,
      const SymbolLayerProperties(
          iconImage: "markerBatimentImage",
          iconSize: 0.17,
          iconAllowOverlap: true,
          symbolSortKey: 10.0));
  mapController?.addLayer(
      GEOJSON_SOURCE_ID,
      "batiments-circles",
      const CircleLayerProperties(circleColor: [
        Expressions.step,
        [Expressions.get, 'point_count'],
        '#04bc94',
        100,
        '#04bc94',
        750,
        '#04bc94'
      ], circleRadius: [
        Expressions.step,
        [Expressions.get, 'point_count'],
        20,
        100,
        20,
        750,
        20
      ]));
  mapController?.addLayer(
      GEOJSON_SOURCE_ID,
      "batiments-count",
      const SymbolLayerProperties(
          textField: [Expressions.get, 'point_count'],
          textFont: ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
          textSize: 12,
          textColor: "#ffffff"));
}

addImageInMap(
    MapboxMapController mapController, String asset, String imageName) async {
  final ByteData bytes = await rootBundle.load(asset);
  final Uint8List list = bytes.buffer.asUint8List();
  mapController.addImage(imageName, list);
}

onFeatureTapped(MapboxMapController mapController) {
  mapController.onFeatureTapped.add((id, point, coordinates) async {
    if (id == "") {
      List<dynamic>? features = await mapController.queryRenderedFeatures(
          point, ["batiments-circles", UNCLUSTERED_POINTS], null);
      if (features.isNotEmpty) {
        onClusterClick(features[0], Offset(point.x, point.y));
      }
    } else {
      mapController.animateCamera(CameraUpdate.zoomIn());
    }
  });
}

onClusterClick(dynamic cluster, Offset point) {
  debugPrint(cluster.toString());
}
