// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-17 11:28:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-10 14:54:32
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/mapboxUtils.dart';
import 'package:positioncollect/src/widgets/bottomSheet.dart';
import 'package:positioncollect/src/widgets/drawer.dart';
import 'package:positioncollect/src/widgets/floatingActionButton.dart';
import 'package:positioncollect/src/widgets/searchBar.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, @required this.position, this.user})
      : super(key: key);
  final Position? position;
  final User? user;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapBloc? _mapBloc;
  String style = mapThemes[1]['style'];

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
            _mapBloc?.add(GetBatiments());
          }
          if (state is UpdateStyle) {
            style = state.style;
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
          if (state is AddMarkerOnMap) {
            bottomSheet(
                context, state.adress!, _mapBloc!, state.position!, true);
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
      floatingActionButton: buildFloatingActionButton(context, _mapBloc),
      drawer: NavigationDrawer(user: widget.user, mapBloc: _mapBloc),
    );
  }
}
