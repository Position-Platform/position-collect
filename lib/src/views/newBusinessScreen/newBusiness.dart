// ignore_for_file: file_names, deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 14:10:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-20 14:41:48
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/models/batiment_model/data.dart';
import 'package:positioncollect/src/models/nominatim_reverse_model/nominatim_reverse_model.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/views/newBusinessScreen/newBusiness2.dart';

class NewBusiness extends StatefulWidget {
  const NewBusiness(
      {Key? key,
      required this.latLng,
      required this.nominatimReverseModel,
      required this.user})
      : super(key: key);
  final LatLng? latLng;
  final NominatimReverseModel nominatimReverseModel;
  final User? user;
  @override
  _NewBusinessState createState() => _NewBusinessState();
}

class _NewBusinessState extends State<NewBusiness> {
  NewBusinessBloc? newBusinessBloc;

  TextEditingController nameController = TextEditingController();
  TextEditingController niveauController = TextEditingController();
  TextEditingController coordonneesController = TextEditingController();
  TextEditingController quartierController = TextEditingController();
  TextEditingController indicationController = TextEditingController();

  String? ville;
  final List _villes = [
    "Yaoundé",
    "Douala",
  ];

  @override
  void initState() {
    super.initState();
    newBusinessBloc = BlocProvider.of<NewBusinessBloc>(context);
    coordonneesController.text = widget.latLng!.longitude.toString() +
        "," +
        widget.latLng!.latitude.toString();
  }

  next() {
    var coordonnees = coordonneesController.text.split(",");
    int randomNumber = Random().nextInt(500000);
    String codeBatiment =
        "BATIMENT_" + quartierController.text + "_" + randomNumber.toString();
    Data batiment = Data(
        idCommercial: widget.user!.commercial!.id,
        codeBatiment: codeBatiment,
        commune:
            widget.nominatimReverseModel.address!.cityDistrict ?? "COMMUNE",
        rue: widget.nominatimReverseModel.address!.road ?? "RUE",
        nom: nameController.text,
        nombreNiveau: niveauController.text,
        longitude: coordonnees[0],
        latitude: coordonnees[1],
        quartier: quartierController.text,
        ville: ville,
        indication: indicationController.text);

    newBusinessBloc?.add(FormPage1(batiment));
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
        if (state is FormError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Remplir tous les champs obligatoires"),
                    Icon(Icons.error)
                  ],
                ),
                backgroundColor: red,
                duration: const Duration(seconds: 4),
              ),
            );
        }
        if (state is GoToPage2) {
          Future.delayed(Duration.zero, () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider<NewBusinessBloc>(
                      create: (context) => getIt<NewBusinessBloc>(),
                      child: NewBusiness2(
                        batiment: state.batiments,
                        user: widget.user,
                      ))),
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
              title: Text(S.of(context).addEtablissement + " (1)",
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
                              height: 40,
                            ),
                            TextField(
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.characters,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nom du Batiment',
                                  prefixIcon: Icon(Icons.business)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: niveauController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nombre de Niveaux',
                                  prefixIcon: Icon(Icons.business)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              enabled: false,
                              style: const TextStyle(fontSize: 13),
                              controller: coordonneesController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Coordonnées',
                                  prefixIcon: Icon(Icons.location_searching)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: quartierController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.characters,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Quartier',
                                  prefixIcon: Icon(Icons.location_on)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: DropdownButtonFormField<String>(
                                dropdownColor: whiteColor,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Ville',
                                    prefixIcon: Icon(Icons.location_city)),
                                hint: const Text("Selectionnez une ville"),
                                value: ville,
                                items: _villes.map((value) {
                                  return DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value,
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    ville = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: indicationController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.characters,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Adresse précise du Batiment',
                                  prefixIcon: Icon(Icons.location_on_rounded)),
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
}
