// ignore_for_file: file_names, deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 14:10:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-14 16:05:35
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/models/sous_categories_model/commodite.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/widgets/buttonForm.dart';
import 'package:positioncollect/src/widgets/chip.dart';

class NewBusiness4 extends StatefulWidget {
  const NewBusiness4({Key? key, required this.commodites}) : super(key: key);
  final List<Commodite> commodites;

  @override
  _NewBusiness4State createState() => _NewBusiness4State();
}

class _NewBusiness4State extends State<NewBusiness4> {
  NewBusinessBloc? newBusinessBloc;

  TextEditingController postalController = TextEditingController();
  TextEditingController siteInternetController = TextEditingController();
  TextEditingController indicationAdresseController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _random = Random();

  @override
  void initState() {
    super.initState();
    newBusinessBloc = BlocProvider.of<NewBusinessBloc>(context);
  }

  next() {}

  back() {}

  @override
  Widget build(BuildContext context) {
    changeStatusColor(transparent);

    return BlocListener<NewBusinessBloc, NewBusinessState>(
      listener: (context, state) {},
      child: BlocBuilder<NewBusinessBloc, NewBusinessState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: whiteColor,
              ),
              systemOverlayStyle: SystemUiOverlayStyle.light,
              centerTitle: true,
              title: Text(S.of(context).addEtablissement + " (4)",
                  style: const TextStyle(fontSize: 18, color: whiteColor)),
              backgroundColor: primaryColor,
              bottom: PreferredSize(
                  child: Container(
                    color: primaryColor,
                    height: 1.0,
                  ),
                  preferredSize: const Size.fromHeight(1.0)),
            ),
            body: Stack(children: [
              Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        dynamicChips(),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: postalController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Code Postal',
                              prefixIcon:
                                  Icon(Icons.local_post_office_outlined)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: siteInternetController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Site Internet',
                              prefixIcon: Icon(Icons.wifi_password_outlined)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: indicationAdresseController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Indication Adresse',
                              prefixIcon:
                                  Icon(Icons.not_listed_location_outlined)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: descriptionController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Description',
                              prefixIcon: Icon(Icons.location_on)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: bottomBar(context, next, back),
              )
            ]),
          );
        },
      ),
    );
  }

  dynamicChips() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(widget.commodites.length, (int index) {
        var element = colorsChips[_random.nextInt(colorsChips.length)];
        return chip(widget.commodites[index].nom!, element, () {});
      }),
    );
  }
}
