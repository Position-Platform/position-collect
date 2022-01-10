// ignore_for_file: deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-10 11:09:34 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-10 11:17:39
 */

/*Checking if your App has been Given Permission*/
import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:positioncollect/generated/l10n.dart';

Future<bool> requestLocationPermission({Function? onPermissionDenied}) async {
  var granted = await _requestPermission(Permission.location);
  if (granted != true) {
    requestLocationPermission();
  }
  debugPrint('requestLocatonPermission $granted');
  return granted;
}

Future<bool> _requestPermission(Permission permission) async {
  var result = await permission.request();
  if (result == PermissionStatus.granted) {
    return true;
  }
  return false;
}

/*Show dialog if GPS not enabled and open settings location*/
Future checkGps(BuildContext ctx) async {
  if (!(await Geolocator.isLocationServiceEnabled())) {
    if (Platform.isAndroid) {
      showDialog(
          context: ctx,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(S.of(context).noLocation),
              content: Text(S.of(context).enableGps),
              actions: <Widget>[
                FlatButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      const AndroidIntent intent = AndroidIntent(
                          action: 'android.settings.LOCATION_SOURCE_SETTINGS');
                      intent.launch();
                      Navigator.of(context, rootNavigator: true).pop();
                      gpsService(ctx);
                    })
              ],
            );
          });
    }
  }
}

/*Check if gps service is enabled or not*/
Future gpsService(BuildContext ctx) async {
  if (!(await Geolocator.isLocationServiceEnabled())) {
    checkGps(ctx);
    return null;
  } else {
    return true;
  }
}
