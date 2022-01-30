/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:44:52 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 06:55:48
 */
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/utils/config.dart';

Widget buildMapBoxMap(String style, MapBloc? _mapBloc, Position position) {
  return MapboxMap(
    attributionEnabled: false,
    logoEnabled: false,
    annotationOrder: const [AnnotationType.symbol],
    compassViewPosition: CompassViewPosition.TopRight,
    zoomGesturesEnabled: true,
    myLocationEnabled: true,
    myLocationTrackingMode: MyLocationTrackingMode.Tracking,
    compassEnabled: true,
    styleString: style,
    accessToken: mapbox_access_token,
    onMapCreated: (controller) =>
        _mapBloc?.add(OnMapInitializedEvent(controller)),
    doubleClickZoomEnabled: true,
    initialCameraPosition: CameraPosition(
        zoom: 15.0, target: LatLng(position.latitude, position.longitude)),
    onStyleLoadedCallback: () {
      _mapBloc?.add(StyleLoadingEvent());
    },
  );
}
