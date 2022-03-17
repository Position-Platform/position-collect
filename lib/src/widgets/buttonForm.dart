/*
 * @Author: Boris Gautier 
 * @Date: 2022-03-14 04:49:55 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-15 10:35:26
 */
// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/utils/colors.dart';

Widget bottomBar(BuildContext context, VoidCallback? next, VoidCallback? back) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: next,
          color: primaryColor,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            S.of(context).next,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        RaisedButton(
          onPressed: back,
          color: red,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            S.of(context).back,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
