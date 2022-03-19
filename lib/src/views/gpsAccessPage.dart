// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 20:25:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-20 20:54:09
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/gps/gps_bloc.dart';
import 'package:positioncollect/src/utils/colors.dart';

class GpsAccessPage extends StatelessWidget {
  const GpsAccessPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocBuilder<GpsBloc, GpsState>(builder: (context, state) {
        return !state.isGpsEnabled
            ? const _EnableGpsMessage()
            : const _AccessBotton();
      })),
    );
  }
}

class _AccessBotton extends StatelessWidget {
  const _AccessBotton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).gpsAccess,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Divider(
          height: 50,
        ),
        MaterialButton(
            child: Text(
              S.of(context).askAccess,
              style: const TextStyle(color: Colors.white),
            ),
            color: primaryColor,
            splashColor: Colors.transparent,
            shape: const StadiumBorder(),
            elevation: 0,
            onPressed: () {
              final gpsBloc = BlocProvider.of<GpsBloc>(context);
              gpsBloc.askGpsAccess();
            })
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).enableGps,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
    );
  }
}
