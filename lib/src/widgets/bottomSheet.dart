// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/sizes.dart';
import 'package:positioncollect/src/views/newBusinessScreen/newBusiness.dart';
import 'package:positioncollect/src/widgets/widgets.dart';
import 'package:positioncollect/generated/l10n.dart';

import '../di/di.dart';

void bottomSheet(BuildContext context, String address, MapBloc _mapBloc,
    String position, bool batiment) {
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
                        child: batiment
                            ? text(S.of(context).adress,
                                textColor: blackColor,
                                fontSize: textSizeLargeMedium)
                            : text(S.of(context).myAdress,
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
                        child: batiment
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RaisedButton(
                                      onPressed: () {
                                        _mapBloc.add(SharePosition(position));
                                      },
                                      color: accentPrimaryColor,
                                      shape: const StadiumBorder(),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 6),
                                      child: const Icon(
                                        Icons.share,
                                        color: whiteColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RaisedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BlocProvider<NewBusinessBloc>(
                                                    create: (context) => getIt<
                                                        NewBusinessBloc>(),
                                                    child: const NewBusiness(),
                                                  )),
                                        );
                                      },
                                      color: primaryColor,
                                      shape: const StadiumBorder(),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 6),
                                      child: const Icon(
                                        Icons.add_business,
                                        color: whiteColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RaisedButton(
                                      onPressed: () {
                                        _mapBloc.add(RemoveMarker());
                                        Navigator.pop(context);
                                      },
                                      color: red,
                                      shape: const StadiumBorder(),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 6),
                                      child: const Icon(
                                        Icons.delete,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width - 200,
                                child: RaisedButton(
                                  onPressed: () {
                                    _mapBloc.add(SharePosition(position));
                                  },
                                  color: accentPrimaryColor,
                                  shape: const StadiumBorder(),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: Text(
                                    S.of(context).shareMyPosition,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
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
