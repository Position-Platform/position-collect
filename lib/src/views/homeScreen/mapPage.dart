// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-17 11:28:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-18 16:49:15
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/widgets/drawer.dart';
import 'package:positioncollect/src/widgets/floatingActionButton.dart';
import 'package:positioncollect/src/widgets/mapbox.dart';
import 'package:positioncollect/src/widgets/searchBar.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, @required this.position}) : super(key: key);
  final Position? position;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapBloc? _mapBloc;
  String style = MapboxStyles.MAPBOX_STREETS;

  @override
  void initState() {
    super.initState();
    _mapBloc = BlocProvider.of<MapBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<MapBloc, MapState>(
        listener: (context, state) {
          if (state is StyleLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text("Style loaded :)"),
              backgroundColor: Theme.of(context).primaryColor,
              duration: const Duration(seconds: 1),
            ));
          }
          if (state is UpdateStyle) {
            style = state.style;
          }
        },
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return Stack(
              children: [
                buildMapBoxMap(style, _mapBloc, widget.position!),
                buildFloatingSearchBar(context),
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          buildFloatingActionButton(context, _mapBloc, widget.position!),
      drawer: buildDrawer(context),
    );
  }
}
