/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:03:44 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-09 09:03:44 
 */
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:positioncollect/src/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onClicked;

  const ButtonWidget({
    Key? key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  // ignore: deprecated_member_use
  Widget build(BuildContext context) => RaisedButton(
        onPressed: onClicked,
        color: primaryColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Text(
          text!,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
}
