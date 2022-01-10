/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:03:28 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-09 14:46:20
 */
// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';
import 'package:positioncollect/src/utils/flutter_overboard/overboard.dart';
import 'package:positioncollect/src/utils/flutter_overboard/page_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LadingPage extends StatefulWidget {
  @override
  _LadingPageState createState() => _LadingPageState();
}

class _LadingPageState extends State<LadingPage> {
  // create each page of onBoard here
  final _pageList = [
    PageModel(
        color: Colors.white,
        imageAssetPath: 'assets/images/tuto1.png',
        title: '',
        body: '',
        doAnimateImage: true),
    PageModel(
        color: Colors.white,
        imageAssetPath: 'assets/images/tuto2.png',
        title: '',
        body: '',
        doAnimateImage: true),
    PageModel(
        color: Colors.white,
        imageAssetPath: 'assets/images/tuto3.png',
        title: '',
        body: '',
        doAnimateImage: true),
    PageModel(
        color: Colors.white,
        imageAssetPath: 'assets/images/tuto4.png',
        title: '',
        body: '',
        doAnimateImage: true),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: OverBoard(
        skipText: S.of(context).skip,
        nextText: S.of(context).next,
        finishText: S.of(context).go,
        pages: _pageList,
        showBullets: true,
        finishCallback: () {
          context.read<AuthBloc>().add(AuthFirst());
        },
      ),
    ));
  }
}
