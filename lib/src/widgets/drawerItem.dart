// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-08 04:48:04 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-10 14:27:39
 */

import 'package:flutter/material.dart';
import 'package:positioncollect/src/utils/colors.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Theme.of(context).backgroundColor == whiteColor
                  ? blackColor
                  : whiteColor,
            ),
            const SizedBox(
              width: 40,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        ),
      ),
    );
  }
}
