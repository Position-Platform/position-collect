// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-17 11:28:40 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-17 11:28:40 
 */
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/src/utils/config.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, @required this.position}) : super(key: key);
  final Position? position;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapboxMapController? mapController;
  var isLight = true;

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  _onStyleLoadedCallback() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Style loaded :)"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: const Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        zoomGesturesEnabled: true,
        myLocationEnabled: true,
        myLocationTrackingMode: MyLocationTrackingMode.Tracking,
        compassEnabled: true,
        styleString: MapboxStyles.MAPBOX_STREETS,
        accessToken: mapbox_access_token,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
            zoom: 16.0,
            target:
                LatLng(widget.position!.latitude, widget.position!.longitude)),
        onStyleLoadedCallback: _onStyleLoadedCallback,
      ),
    );
  }
}
