// ignore_for_file: file_names, deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 14:10:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-14 16:52:21
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/models/sous_categories_model/commodite.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/widgets/buttonForm.dart';

class NewBusiness5 extends StatefulWidget {
  const NewBusiness5({Key? key, required this.commodites}) : super(key: key);
  final List<Commodite> commodites;

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
            body: Stack(children: [
              Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        TextField(
                          controller: servicesController,
                          keyboardType: TextInputType.text,
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
                              prefixIcon: Icon(Icons.location_on)),
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
