// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-17 11:28:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 01:42:35
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/widgets/drawer.dart';
import 'package:positioncollect/src/widgets/floatingActionButton.dart';
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
    _mapBloc?.add(GetBatiments());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<MapBloc, MapState>(
        listener: (context, state) {
          if (state is StyleLoaded) {}
          if (state is UpdateStyle) {
            style = state.style;
            _mapBloc?.add(GetBatiments());
          }
          if (state is BatimentsLoading) {}
          if (state is BatimentsLoadingError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Error"),
              backgroundColor: red,
              duration: Duration(seconds: 5),
            ));
          }
          if (state is BatimentsLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  state.batimentNumber.toString() + " " + S.of(context).loaded),
              backgroundColor: green,
              duration: const Duration(seconds: 5),
            ));
          }
        },
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return Stack(
              fit: StackFit.expand,
              children: [
                buildFloatingSearchBar(
                    context, _mapBloc, style, widget.position!),
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
