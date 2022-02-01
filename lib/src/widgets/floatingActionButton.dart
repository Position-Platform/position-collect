// ignore_for_file: deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:44:47 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-01 17:39:54
 */
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/mapboxUtils.dart';
import 'package:positioncollect/src/utils/sizes.dart';
import 'package:positioncollect/src/widgets/widgets.dart';

Widget buildFloatingActionButton(BuildContext context, MapBloc? _mapBloc) {
  bool keyboardIsOpened = false;
  bool isLoading = false;
  String address = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  return BlocListener<MapBloc, MapState>(
    listener: (context, state) {
      if (state is KeyBoardStatus) {
        keyboardIsOpened = state.keyboardStatus!;
      }
      if (state is AdressLoading) {
        isLoading = true;
      }
      if (state is UserAdress) {
        isLoading = false;
        address = state.adress!;
        bootomSheet(context, address, _mapBloc!, state.position!);
      }
    },
    child: BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return Stack(
          key: _scaffoldKey,
          children: keyboardIsOpened
              ? []
              : [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton.extended(
                      backgroundColor: whiteColor,
                      icon: isLoading
                          ? const CircularProgressIndicator(
                              backgroundColor: primaryColor,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  accentPrimaryColor),
                            )
                          : const Icon(
                              Icons.my_location,
                              color: primaryColor,
                            ),
                      onPressed: () async {
                        _mapBloc!.add(GetUserAdress());
                      },
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
                                _mapBloc?.add(GetUserLocationEvent());
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

void bootomSheet(
    BuildContext context, String address, MapBloc _mapBloc, Position position) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              width: 50,
              height: 10,
              decoration: boxDecoration(
                  color: viewColor, radius: 16, bgColor: greyColor),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: greyColor),
              height: MediaQuery.of(context).size.width - 180,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 16),
                      Center(
                        child: text("Mon Adresse",
                            textColor: blackColor,
                            fontSize: textSizeLargeMedium),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(address.toUpperCase(),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: secondaryTextStyle(
                                weight: FontWeight.bold,
                                color: primaryColor,
                                size: 15)),
                      ),
                      divider(),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 200,
                          child: RaisedButton(
                            onPressed: () {
                              _mapBloc.add(SharePosition(position));
                            },
                            color: accentPrimaryColor,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: const Text(
                              "Partager ma position",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      });
}
