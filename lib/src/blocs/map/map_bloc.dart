/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:45:15 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-20 20:59:52
 */
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapboxMapController? _mapController;

  MapBloc() : super(MapInitial()) {
    on<OnMapInitializedEvent>(_onInitMap);
    on<StyleLoadingEvent>(_styleLoading);
    on<ZoomInEvent>(_zoomIn);
    on<ZoomOutEvent>(_zoomOut);
    on<GetUserLocationEvent>(_getUserLocation);
    on<UpdateStyleEvent>(_updateStyle);
  }

  void _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;
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

  @override
  Future<void> close() {
    return super.close();
  }
}
