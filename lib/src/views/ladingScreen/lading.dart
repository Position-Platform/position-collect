/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:03:28 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 12:45:49
 */
// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';
import 'package:positioncollect/src/utils/flutter_overboard/overboard.dart';
import 'package:positioncollect/src/utils/flutter_overboard/page_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/src/utils/ladingUtils.dart';

class LadingPage extends StatefulWidget {
  @override
  _LadingPageState createState() => _LadingPageState();
}

class _LadingPageState extends State<LadingPage> {
  List<PageModel> _pageList = [];

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
    final Locale appLocale = Localizations.localeOf(context);

    if (appLocale.languageCode == "fr") {
      _pageList = pageListFr;
    } else {
      _pageList = pageListEn;
    }

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
