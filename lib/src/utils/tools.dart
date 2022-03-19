/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:03:16 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-16 12:15:14
 */
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:http/http.dart';
import 'package:positioncollect/src/utils/config.dart';

changeStatusColor(Color color) async {
  try {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(
        useWhiteForeground(color));
  } on Exception catch (e) {
    print(e);
  }
}

Future<int?> uploadImage(path, filepath, url, token) async {
  var request = MultipartRequest('POST', Uri.parse(url));
  request.headers
      .addAll({'X-Authorization': apiKey, 'Authorization': "Bearer " + token});
  request.files.add(await MultipartFile.fromPath(path, filepath));
  request.fields['_method'] = 'PUT';
  var res = await request.send();
  return res.statusCode;
}

Future<int?> postImage(
    path, filepath, url, token, String idEtablissement) async {
  var request = MultipartRequest('POST', Uri.parse(url));
  request.headers
      .addAll({'X-Authorization': apiKey, 'Authorization': "Bearer " + token});
  request.files.add(await MultipartFile.fromPath(path, filepath));
  request.fields['idEtablissement'] = idEtablissement;
  print(request.files);
  var res = await request.send();

  return res.statusCode;
}
