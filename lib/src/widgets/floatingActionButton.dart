// ignore_for_file: deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:44:47 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-20 15:03:38
 */
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/utils/mapboxUtils.dart';
import 'package:positioncollect/src/widgets/bottomSheet.dart';
import 'package:share_plus/share_plus.dart';

Widget buildFloatingActionButton(
    BuildContext context, MapBloc? _mapBloc, User user) {
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
        bottomSheet(context, address, _mapBloc!, state.position!, false,
            state.nominatimReverseModel!, user);
      }
      if (state is UrlPositionShared) {
        Share.share(S.of(context).shareContent + "\n" + state.url!,
            subject: appName);
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
                      heroTag: "btn1",
                      backgroundColor: Theme.of(context).backgroundColor,
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
                        style: Theme.of(context).textTheme.bodyText1,
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
                              heroTag: "btn2",
                              tooltip: "Zoom +",
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              mini: true,
                              onPressed: () {
                                _mapBloc?.add(ZoomInEvent());
                              },
                              child: Icon(
                                Icons.zoom_in,
                                color: Theme.of(context).backgroundColor ==
                                        whiteColor
                                    ? blackColor
                                    : whiteColor,
                              )),
                          FloatingActionButton(
                            heroTag: "btn3",
                            tooltip: "Zoom -",
                            backgroundColor: Theme.of(context).backgroundColor,
                            mini: true,
                            onPressed: () {
                              _mapBloc?.add(ZoomOutEvent());
                            },
                            child: Icon(
                              Icons.zoom_out,
                              color: Theme.of(context).backgroundColor ==
                                      whiteColor
                                  ? blackColor
                                  : whiteColor,
                            ),
                          ),
                          const Divider(
                            height: 300,
                            color: transparent,
                          ),
                          FloatingActionButton(
                              heroTag: "btn4",
                              mini: true,
                              tooltip: "Location",
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              onPressed: () {
                                _mapBloc?.add(GetUserLocationEvent());
                              },
                              child: Icon(
                                Icons.navigation,
                                color: Theme.of(context).backgroundColor ==
                                        whiteColor
                                    ? blackColor
                                    : whiteColor,
                              )),
                          FloatingActionButton(
                            heroTag: "btn5",
                            mini: true,
                            backgroundColor: Theme.of(context).backgroundColor,
                            tooltip: "Layers",
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                    padding: const EdgeInsets.all(20),
                                    color: Theme.of(context).backgroundColor,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          S.of(context).selectLayer,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
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
                                                            right: 10,
                                                            left: 10),
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
                            child: Icon(
                              Icons.layers,
                              color: Theme.of(context).backgroundColor ==
                                      whiteColor
                                  ? blackColor
                                  : whiteColor,
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
