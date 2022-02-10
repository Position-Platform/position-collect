import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/src/utils/config.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key, this.latLng}) : super(key: key);

  final LatLng? latLng;

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  MapboxMapController? mapController;

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  _onStyleLoadedCallback() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 2,
            child: Stack(
              children: [
                _buildMapBoxMap(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMapBoxMap() {
    return MapboxMap(
      attributionEnabled: false,
      logoEnabled: false,
      annotationOrder: const [AnnotationType.symbol],
      zoomGesturesEnabled: true,
      myLocationEnabled: true,
      myLocationTrackingMode: MyLocationTrackingMode.None,
      compassEnabled: false,
      styleString: MapboxStyles.MAPBOX_STREETS,
      accessToken: mapbox_access_token,
      onMapCreated: _onMapCreated,
      doubleClickZoomEnabled: true,
      initialCameraPosition: CameraPosition(zoom: 15.0, target: widget.latLng!),
      onStyleLoadedCallback: _onStyleLoadedCallback,
    );
  }
}
