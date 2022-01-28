// ignore_for_file: avoid_print

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:45:15 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 01:47:17
 */
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/src/models/search_model/datum.dart';
import 'package:positioncollect/src/repositories/position/batiments/batimentsRepository.dart';
import 'package:positioncollect/src/repositories/position/etablissements/etablissementsRepository.dart';
import 'package:positioncollect/src/utils/mapboxUtils.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapboxMapController? _mapController;
  BatimentsRepository? batimentsRepository;
  EtablissementsRepository? etablissementsRepository;

  MapBloc({this.batimentsRepository, this.etablissementsRepository})
      : super(MapInitial()) {
    on<OnMapInitializedEvent>(_onInitMap);
    on<StyleLoadingEvent>(_styleLoading);
    on<ZoomInEvent>(_zoomIn);
    on<ZoomOutEvent>(_zoomOut);
    on<GetUserLocationEvent>(_getUserLocation);
    on<UpdateStyleEvent>(_updateStyle);
    on<GetBatiments>(_getBatiments);
    on<SearchEtablissements>(_searchEtablissements);
  }

  Future<void> _onInitMap(
      OnMapInitializedEvent event, Emitter<MapState> emit) async {
    _mapController = event.controller;
    final ByteData bytes = await rootBundle.load("assets/images/building.png");
    final Uint8List list = bytes.buffer.asUint8List();
    _mapController?.addImage("markerBatimentImage", list);
    _mapController?.onFeatureTapped.add((id, point, coordinates) async {
      if (id == "") {
        List<dynamic>? features = await _mapController?.queryRenderedFeatures(
            point, ["batiments-circles", UNCLUSTERED_POINTS], null);
        if (features!.isNotEmpty) {
          onClusterClick(features[0], Offset(point.x, point.y));
        }
      } else {
        _mapController?.animateCamera(CameraUpdate.zoomIn());
      }
    });
  }

  void _zoomIn(ZoomInEvent event, Emitter<MapState> emit) {
    _mapController?.animateCamera(CameraUpdate.zoomIn());
  }

  void _zoomOut(ZoomOutEvent event, Emitter<MapState> emit) {
    _mapController?.animateCamera(CameraUpdate.zoomOut());
  }

  void _getUserLocation(GetUserLocationEvent event, Emitter<MapState> emit) {
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(event.position.latitude, event.position.longitude),
        zoom: 15)));
  }

  void _updateStyle(UpdateStyleEvent event, Emitter<MapState> emit) {
    emit(UpdateStyle(event.style));
  }

  void _styleLoading(StyleLoadingEvent event, Emitter<MapState> emit) {
    emit(StyleLoaded());
  }

  void _getBatiments(
    GetBatiments event,
    Emitter<MapState> emit,
  ) async {
    emit(BatimentsLoading());
    final batimentsResult = await batimentsRepository?.getBatiments();

    var responses = [];

    for (var i = 0; i < batimentsResult!.success!.data!.length; i++) {
      var element = batimentsResult.success!.data![i];
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

    try {
      addGeoJsonInmap(_mapController, geojson);
      return emit(BatimentsLoaded());
    } catch (e) {
      return emit(BatimentsLoadingError());
    }
  }

  onClusterClick(dynamic cluster, Offset point) {
    debugPrint(cluster.toString());
  }

  void _searchEtablissements(
    SearchEtablissements event,
    Emitter<MapState> emit,
  ) async {
    emit(SearchLoading());

    try {
      final searchResult =
          await etablissementsRepository?.searchEtablissements(event.query);

      emit(SearchComplete(searchResult!.success!.data));
    } catch (e) {
      emit(SearchError());
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
