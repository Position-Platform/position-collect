// ignore_for_file: file_names, deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 14:10:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-17 00:35:55
 */

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/models/etablissement_model/data.dart';
import 'package:positioncollect/src/models/sous_categories_model/commodite.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/views/newBusinessScreen/newBusiness5.dart';

class NewBusiness4 extends StatefulWidget {
  const NewBusiness4(
      {Key? key,
      required this.commodites,
      required this.etablissements,
      required this.cover,
      required this.idSousCatgorie,
      required this.user})
      : super(key: key);
  final List<Commodite> commodites;
  final Data etablissements;
  final File cover;
  final int idSousCatgorie;
  final User? user;

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

  List<int> selectCommodites = [];

  @override
  void initState() {
    super.initState();
    newBusinessBloc = BlocProvider.of<NewBusinessBloc>(context);
  }

  next() {
    widget.etablissements.codePostal = postalController.text;
    widget.etablissements.siteInternet = siteInternetController.text;
    widget.etablissements.indicationAdresse = indicationAdresseController.text;
    widget.etablissements.description = descriptionController.text;
    String idCommodite = selectCommodites.join(",");

    newBusinessBloc?.add(FormPage4(widget.etablissements, widget.cover.path,
        widget.idSousCatgorie, idCommodite));
  }

  back() {
    Future.delayed(Duration.zero, () async {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(transparent);

    return BlocListener<NewBusinessBloc, NewBusinessState>(
      listener: (context, state) {
        if (state is GoToPage5) {
          Future.delayed(Duration.zero, () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider<NewBusinessBloc>(
                      create: (context) => getIt<NewBusinessBloc>(),
                      child: NewBusiness5(
                          etablissements: state.etablissements,
                          idCommodite: state.idCommodite,
                          cover: File(state.coverPath),
                          idSousCatgorie: state.idSousCategorie,
                          user: widget.user))),
            );
          });
        }
      },
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
            body: SingleChildScrollView(
              child: Stack(children: [
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Center(
                              child: Text("Liste des commodités"),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Wrap(
                              spacing: 6,
                              direction: Axis.horizontal,
                              children: commoditesChips(),
                            ),
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
                                  prefixIcon:
                                      Icon(Icons.wifi_password_outlined)),
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
                            const SizedBox(
                              height: 25,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RaisedButton(
                                      onPressed: next,
                                      color: primaryColor,
                                      shape: const StadiumBorder(),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 6),
                                      child: Text(
                                        S.of(context).next,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RaisedButton(
                                      onPressed: back,
                                      color: red,
                                      shape: const StadiumBorder(),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 6),
                                      child: Text(
                                        S.of(context).back,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }

  List<Widget> commoditesChips() {
    List<Widget> chips = [];
    for (int i = 0; i < widget.commodites.length; i++) {
      var element = colorsChips[_random.nextInt(colorsChips.length)];
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: ChoiceChip(
          label: Text(widget.commodites[i].nom!),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: element,
          selected: selectCommodites.contains(widget.commodites[i].id!),
          onSelected: (bool value) {
            if (selectCommodites.contains(widget.commodites[i].id!)) {
              setState(() {
                selectCommodites.remove(widget.commodites[i].id!);
              });
            } else {
              setState(() {
                selectCommodites.add(widget.commodites[i].id!);
              });
            }
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
