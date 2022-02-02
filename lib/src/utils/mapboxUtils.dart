/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-24 13:36:42 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-02 14:48:32
 */
// ignore_for_file: file_names, constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/src/models/batiments_model/datum.dart';

const String GEOJSON_SOURCE_ID = "geojson-source-id";
const String UNCLUSTERED_POINTS = "unclustered-points";

List<dynamic> mapThemes = [
  {
    'name': 'Dark',
    'style': "mapbox://styles/gauty96/ckz19n3kd005e14nttywbodgs",
    'image': 'assets/images/osm_dark.png'
  },
  {
    'name': 'Street',
    'style': "mapbox://styles/gauty96/ckz194r6x000616o9hq4pcgkz",
    'image': 'assets/images/mapbox_street.png'
  },
  {
    'name': 'Satellite',
    'style': "mapbox://styles/gauty96/ckz19k4o5000n15p3y8rl29p7",
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

Future<void> addGeoJsonInmap(
    MapboxMapController? mapController, Map<String, Object> geojson) async {
  await mapController?.addSource(
      GEOJSON_SOURCE_ID,
      GeojsonSourceProperties(
          data: geojson, cluster: true, clusterMaxZoom: 16, clusterRadius: 50));

  await mapController?.addLayer(
      GEOJSON_SOURCE_ID,
      UNCLUSTERED_POINTS,
      const SymbolLayerProperties(
          iconImage: "building",
          iconSize: 2.8,
          iconAllowOverlap: true,
          symbolSortKey: 10.0));
  await mapController?.addLayer(
      GEOJSON_SOURCE_ID,
      "batiments-circles",
      const CircleLayerProperties(circleColor: [
        Expressions.step,
        [Expressions.get, 'point_count'],
        '#04bc94',
        20,
        '#04bc94',
        150,
        '#04bc94'
      ], circleRadius: [
        Expressions.step,
        [Expressions.get, 'point_count'],
        20,
        20,
        20,
        150,
        20
      ]));
  await mapController?.addLayer(
      GEOJSON_SOURCE_ID,
      "property",
      const SymbolLayerProperties(
          textField: [Expressions.get, 'point_count'],
          textSize: 12,
          textColor: "#ffffff",
          textIgnorePlacement: true,
          textAllowOverlap: true));
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
