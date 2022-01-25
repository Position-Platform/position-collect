/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:45:15 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-24 14:07:17
 */
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/src/repositories/position/batiments/batimentsRepository.dart';
import 'package:positioncollect/src/utils/mapboxUtils.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapboxMapController? _mapController;
  BatimentsRepository? batimentsRepository;

  MapBloc({this.batimentsRepository}) : super(MapInitial()) {
    on<OnMapInitializedEvent>(_onInitMap);
    on<StyleLoadingEvent>(_styleLoading);
    on<ZoomInEvent>(_zoomIn);
    on<ZoomOutEvent>(_zoomOut);
    on<GetUserLocationEvent>(_getUserLocation);
    on<UpdateStyleEvent>(_updateStyle);
    on<GetBatiments>(_getBatiments);
    on<ShowBatiments>(_showBatiments);
  }

  Future<void> _onInitMap(
      OnMapInitializedEvent event, Emitter<MapState> emit) async {
    _mapController = event.controller;
    final ByteData bytes = await rootBundle.load("assets/images/building.png");
    final Uint8List list = bytes.buffer.asUint8List();
    _mapController?.addImage("markerBatimentImage", list);
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
    final batimentsResult = await batimentsRepository?.getBatiments();

    emit(BatimentsLoaded(batimentsResult!.success!));
  }

  void _showBatiments(ShowBatiments event, Emitter<MapState> emit) {
    _mapController?.addSource(
        GEOJSON_SOURCE_ID,
        GeojsonSourceProperties(
            data: json.decode(event.geojsonBatiments),
            cluster: true,
            clusterMaxZoom: 16,
            clusterRadius: 50));
    _mapController?.addLayer(
        GEOJSON_SOURCE_ID,
        UNCLUSTERED_POINTS,
        const SymbolLayerProperties(
            iconImage: "markerBatimentImage",
            iconSize: 0.17,
            iconAllowOverlap: true,
            symbolSortKey: 10.0));
    _mapController?.addLayer(
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
    _mapController?.addLayer(
        GEOJSON_SOURCE_ID,
        "batiments-count",
        const SymbolLayerProperties(
            textField: [Expressions.get, 'point_count'],
            textFont: ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
            textSize: 12,
            textColor: "#ffffff"));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
