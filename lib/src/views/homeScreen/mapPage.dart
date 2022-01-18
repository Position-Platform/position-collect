// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-17 11:28:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-18 16:49:15
 */

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/utils/mapboxUtils.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, @required this.position}) : super(key: key);
  final Position? position;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapboxMapController? mapController;
  var isLight = true;
  String style = MapboxStyles.MAPBOX_STREETS;

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
        compassViewPosition: CompassViewPosition.TopRight,
        zoomGesturesEnabled: true,
        myLocationEnabled: true,
        myLocationTrackingMode: MyLocationTrackingMode.Tracking,
        compassEnabled: true,
        styleString: style,
        accessToken: mapbox_access_token,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
            zoom: 15.0,
            target:
                LatLng(widget.position!.latitude, widget.position!.longitude)),
        onStyleLoadedCallback: _onStyleLoadedCallback,
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          FloatingActionButton(
              tooltip: "Zoom +",
              backgroundColor: whiteColor,
              mini: true,
              onPressed: () {
                mapController?.animateCamera(CameraUpdate.zoomIn());
              },
              child: const Icon(
                Icons.zoom_in,
                color: blackColor,
              )),
          FloatingActionButton(
            tooltip: "Zoom -",
            backgroundColor: whiteColor,
            mini: true,
            onPressed: () {
              mapController?.animateCamera(CameraUpdate.zoomOut());
            },
            child: const Icon(
              Icons.zoom_out,
              color: blackColor,
            ),
          ),
          const Divider(
            height: 300,
            color: transparent,
          ),
          FloatingActionButton(
              mini: true,
              tooltip: "Location",
              backgroundColor: whiteColor,
              onPressed: () {
                mapController?.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: LatLng(widget.position!.latitude,
                            widget.position!.longitude),
                        zoom: 15)));
              },
              child: const Icon(
                Icons.navigation,
                color: blackColor,
              )),
          FloatingActionButton(
            mini: true,
            backgroundColor: whiteColor,
            tooltip: "Layers",
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).selectLayer,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mapThemes.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      style = mapThemes[index]['style'];
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 100,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              mapThemes[index]['image']),
                                        )),
                                  ),
                                );
                              }),
                        ),
                      ],
                    )),
              );
            },
            child: const Icon(
              Icons.layers,
              color: blackColor,
            ),
          ),
          const Divider(
            height: 100,
            color: transparent,
          ),
        ],
      ),
    );
  }
}
