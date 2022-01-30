// ignore_for_file: avoid_print

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:45:15 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 01:47:17
 */
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/src/models/search_model/datum.dart';
import 'package:positioncollect/src/repositories/batiments/batimentsRepository.dart';
import 'package:positioncollect/src/repositories/etablissements/etablissementsRepository.dart';
import 'package:positioncollect/src/repositories/tracking/trackingRepository.dart';
import 'package:positioncollect/src/utils/mapboxUtils.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapboxMapController? _mapController;
  BatimentsRepository? batimentsRepository;
  EtablissementsRepository? etablissementsRepository;
  TrackingRepository? trackingRepository;

  late StreamSubscription<bool> keyboardSubscription;
  late StreamSubscription<Position> positionStream;
  var keyboardVisibilityController = KeyboardVisibilityController();

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  MapBloc(
      {this.batimentsRepository,
      this.etablissementsRepository,
      this.trackingRepository})
      : super(MapInitial()) {
    on<OnMapInitializedEvent>(_onInitMap);
    on<StyleLoadingEvent>(_styleLoading);
    on<ZoomInEvent>(_zoomIn);
    on<ZoomOutEvent>(_zoomOut);
    on<GetUserLocationEvent>(_getUserLocation);
    on<UpdateStyleEvent>(_updateStyle);
    on<GetBatiments>(_getBatiments);
    on<SearchEtablissements>(_searchEtablissements);
    on<SetKeyBoardStatus>(_setKeyBoardStatus);
  }

  void _setKeyBoardStatus(SetKeyBoardStatus event, Emitter<MapState> emit) {
    emit(KeyBoardStatus(event.keyboardStatus));
  }

  Future<void> _onInitMap(
      OnMapInitializedEvent event, Emitter<MapState> emit) async {
    _mapController = event.controller;

    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) async {
      add(SetKeyBoardStatus(visible));
    });

    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) async {
      await trackingRepository?.addtracking(
          position!.longitude.toString(), position.latitude.toString());
    });

    onFeatureTapped(_mapController!);
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

    var geojson = createGeoJsonBatiments(batimentsResult!.success!.data!);

    try {
      await addGeoJsonInmap(_mapController, geojson);
      return emit(BatimentsLoaded(batimentsResult.success!.data!.length));
    } catch (e) {
      return emit(BatimentsLoadingError());
    }
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
    keyboardSubscription.cancel();
    return super.close();
  }
}
