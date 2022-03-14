// ignore_for_file: file_names, deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 14:10:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-13 15:45:55
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/widgets/buttonForm.dart';

class NewBusiness extends StatefulWidget {
  const NewBusiness({Key? key, required this.latLng}) : super(key: key);
  final LatLng? latLng;
  @override
  _NewBusinessState createState() => _NewBusinessState();
}

class _NewBusinessState extends State<NewBusiness> {
  NewBusinessBloc? newBusinessBloc;

  TextEditingController nameController = TextEditingController();
  TextEditingController niveauController = TextEditingController();
  TextEditingController coordonneesController = TextEditingController();
  TextEditingController quartierController = TextEditingController();

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
            body: Stack(children: [
              Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
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
}
