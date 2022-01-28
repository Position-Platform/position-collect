/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:44:47 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-20 14:44:47 
 */
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/mapboxUtils.dart';

Widget buildFloatingActionButton(
    BuildContext context, MapBloc? _mapBloc, Position position) {
  bool keyboardIsOpened = false;
  return BlocListener<MapBloc, MapState>(
    listener: (context, state) {
      if (state is KeyBoardStatus) {
        keyboardIsOpened = state.keyboardStatus!;
      }
    },
    child: BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return Stack(
          children: keyboardIsOpened
              ? []
              : [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton.extended(
                      backgroundColor: whiteColor,
                      icon: const Icon(
                        Icons.my_location,
                        color: primaryColor,
                      ),
                      onPressed: null,
                      label: Text(
                        S.of(context).findPosition,
                        style: const TextStyle(color: blackColor),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: <Widget>[
                          FloatingActionButton(
                              tooltip: "Zoom +",
                              backgroundColor: whiteColor,
                              mini: true,
                              onPressed: () {
                                _mapBloc?.add(ZoomInEvent());
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
                              _mapBloc?.add(ZoomOutEvent());
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
                                _mapBloc?.add(GetUserLocationEvent(position));
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
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                    _mapBloc?.add(
                                                        UpdateStyleEvent(
                                                            mapThemes[index]
                                                                ['style']));

                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                              mapThemes[index]
                                                                  ['image']),
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
                    ),
                  )
                ],
        );
      },
    ),
  );
}
