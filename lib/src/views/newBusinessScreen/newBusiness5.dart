// ignore_for_file: file_names, deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 14:10:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-17 01:24:51
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/models/etablissement_model/data.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/views/newBusinessScreen/newBusiness6.dart';

class NewBusiness5 extends StatefulWidget {
  const NewBusiness5(
      {Key? key,
      required this.idCommodite,
      required this.etablissements,
      required this.cover,
      required this.idSousCatgorie,
      required this.user})
      : super(key: key);
  final String idCommodite;
  final Data etablissements;
  final File cover;
  final int idSousCatgorie;
  final User? user;

  @override
  _NewBusiness5State createState() => _NewBusiness5State();
}

class _NewBusiness5State extends State<NewBusiness5> {
  NewBusinessBloc? newBusinessBloc;

  TextEditingController servicesController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController whatsapp1Controller = TextEditingController();
  TextEditingController whatsapp2Controller = TextEditingController();
  TextEditingController ameliorationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    newBusinessBloc = BlocProvider.of<NewBusinessBloc>(context);
  }

  next() {
    if (servicesController.text.isEmpty ||
        phoneController.text.isEmpty ||
        whatsapp1Controller.text.isEmpty) {
      Fluttertoast.showToast(msg: "Remplissez tous les champs obligatoires");
    } else {
      widget.etablissements.services = servicesController.text;
      widget.etablissements.phone = phoneController.text;
      widget.etablissements.whatsapp1 = whatsapp1Controller.text;
      widget.etablissements.whatsapp2 = whatsapp2Controller.text;
      widget.etablissements.ameliorations = ameliorationController.text;

      newBusinessBloc?.add(AddEtablissement(widget.etablissements,
          widget.cover.path, widget.idSousCatgorie, widget.idCommodite));
    }
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
        if (state is PageLoading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Création de l'etablissemnt..."),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state is Error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Echec de création de l'etablissement..."),
                    Icon(Icons.error)
                  ],
                ),
                backgroundColor: red,
                duration: const Duration(seconds: 4),
              ),
            );
        }
        if (state is EtablissementAdded) {
          Future.delayed(Duration.zero, () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider<NewBusinessBloc>(
                      create: (context) => getIt<NewBusinessBloc>(),
                      child: NewBusiness6(
                          etablissements: state.etablissements,
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
              title: Text(S.of(context).addEtablissement + " (5)",
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
                              controller: servicesController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.characters,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Autres Services',
                                  prefixIcon: Icon(Icons.list_alt)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Numéro de Téléphone',
                                  prefixIcon: Icon(Icons.phone_android)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: whatsapp1Controller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Whatsapp 1',
                                  prefixIcon: Icon(Icons.whatsapp)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: whatsapp2Controller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Whatsapp 2',
                                  prefixIcon: Icon(Icons.whatsapp)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: ameliorationController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Idées d'amelioration",
                                  prefixIcon: Icon(Icons.list_alt)),
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
