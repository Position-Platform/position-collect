// ignore_for_file: use_key_in_widget_constructors

/*
 * Created on Fri Jan 07 2022 by Boris Gautier
 *
 * Copyright (c) 2022 
 */

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/sizes.dart';
import 'package:positioncollect/src/utils/tools.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(whiteColor);
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: EdgeInsets.all(fixPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo-nom.png',
                width: 200.0,
                fit: BoxFit.fitWidth,
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              const SpinKitPulse(
                color: primaryColor,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
