// ignore_for_file: avoid_print, use_key_in_widget_constructors

/*
 * Created on Sat Jan 08 2022 by Boris Gautier
 *
 * Copyright (c) 2022 
 */

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/widgets/buttonWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: '',
              body: '',
              image: buildImage('assets/images/tuto1.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              body: '',
              image: buildImage('assets/images/tuto2.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              body: '',
              image: buildImage('assets/images/tuto3.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              body: '',
              footer: ButtonWidget(
                text: S.of(context).go,
                onClicked: () => context.read<AuthBloc>().add(AuthFirst()),
              ),
              image: buildImage('assets/images/tuto4.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text(S.of(context).go,
              style: const TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => context.read<AuthBloc>().add(AuthFirst()),
          showSkipButton: true,
          skip: Text(S.of(context).skip),
          onSkip: () => context.read<AuthBloc>().add(AuthFirst()),
          next: const Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).primaryColor,
          skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: greyColor,
        activeColor: accentPrimaryColor,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle:
            const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: const TextStyle(fontSize: 20),
        descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
