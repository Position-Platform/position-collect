// ignore_for_file: file_names, deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 14:10:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-16 13:13:57
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/models/batiment_model/horaire.dart';
import 'package:positioncollect/src/models/etablissement_model/data.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/views/newBusinessScreen/newBusiness7.dart';
import 'package:time_interval_picker/time_interval_picker.dart';
import 'package:weekday_selector/weekday_selector.dart';

class NewBusiness6 extends StatefulWidget {
  const NewBusiness6(
      {Key? key, required this.etablissements, required this.user})
      : super(key: key);
  final Data etablissements;
  final User? user;

  @override
  _NewBusiness6State createState() => _NewBusiness6State();
}

class _NewBusiness6State extends State<NewBusiness6> {
  NewBusinessBloc? newBusinessBloc;

  @override
  void initState() {
    super.initState();
    newBusinessBloc = BlocProvider.of<NewBusinessBloc>(context);
  }

  final values = <bool?>[null, false, false, false, false, false, null];

  List<Horaire> horaires = [];

  Horaire? horaire;

  next() {
    horaires = [];
    if (daySelect.isNotEmpty && weekDayTime == null) {
      Fluttertoast.showToast(msg: "Selectionnez les horaires de la semaine");
    } else {
      for (var i = 0; i < daySelect.length; i++) {
        horaire = Horaire(
            idEtablissement: widget.etablissements.id,
            jour: daySelect[i],
            plageHoraire: weekDayTime);
        horaires.add(horaire!);
      }

      if (selectedSamedi! && samediDayTime != null) {
        horaire = Horaire(
            idEtablissement: widget.etablissements.id,
            jour: "Samedi",
            plageHoraire: samediDayTime);
        horaires.add(horaire!);
      } else if (selectedSamedi! && samediDayTime == null) {
        Fluttertoast.showToast(msg: "Selectionnez l'horaire de samedi");
      }

      if (selectedDimanche! && dimancheDayTime != null) {
        horaire = Horaire(
            idEtablissement: widget.etablissements.id,
            jour: "Dimanche",
            plageHoraire: dimancheDayTime);
        horaires.add(horaire!);
      } else if (selectedDimanche! && dimancheDayTime == null) {
        Fluttertoast.showToast(msg: "Selectionnez l'horaire de dimanche");
      }

      newBusinessBloc?.add(AddHoraires(horaires));
    }
  }

  back() {
    Future.delayed(Duration.zero, () async {
      Navigator.of(context).pop();
    });
  }

  bool? selectedSamedi = false;
  bool? selectedDimanche = false;

  String? weekDayTime;
  String? samediDayTime;
  String? dimancheDayTime;
  List<String> daySelect = [];

  final f = DateFormat('HH:mm');

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
                    Text("Ajout des Horaires..."),
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
                    Text("Echec lors de l'ajout des horaires..."),
                    Icon(Icons.error)
                  ],
                ),
                backgroundColor: red,
                duration: const Duration(seconds: 4),
              ),
            );
        }
        if (state is HorairesAdded) {
          Future.delayed(Duration.zero, () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider<NewBusinessBloc>(
                      create: (context) => getIt<NewBusinessBloc>(),
                      child: NewBusiness7(
                          etablissements: widget.etablissements,
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
              title: Text(S.of(context).addEtablissement + " (6)",
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
                            const Text("Jours de la semaine"),
                            WeekdaySelector(
                              displayedDays: const {
                                DateTime.sunday,
                                DateTime.monday,
                                DateTime.tuesday,
                                DateTime.wednesday,
                                DateTime.thursday,
                              },
                              shortWeekdays: const [
                                "Di",
                                "Lu",
                                "Ma",
                                "Me",
                                "Je",
                                "Ve",
                                "Sa",
                              ],
                              selectedFillColor: accentPrimaryColor,
                              onChanged: (v) {
                                printIntAsDay(v);
                                setState(() {
                                  values[v % 7] = !values[v % 7]!;
                                });
                              },
                              selectedElevation: 15,
                              elevation: 5,
                              disabledElevation: 0,
                              values: values,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            daySelect.isNotEmpty
                                ? TimeIntervalPicker(
                                    endLimit: null,
                                    startLimit: null,
                                    onChanged: (DateTime? startTime,
                                        DateTime? endTime, bool isAllDay) {
                                      weekDayTime = f.format(startTime!) +
                                          "-" +
                                          f.format(endTime!);
                                    },
                                  )
                                : const SizedBox(),
                            const SizedBox(
                              height: 25,
                            ),
                            Card(
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: CheckboxListTile(
                                title: const Text("Samedi",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                value: selectedSamedi,
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectedSamedi = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            selectedSamedi!
                                ? TimeIntervalPicker(
                                    endLimit: null,
                                    startLimit: null,
                                    onChanged: (DateTime? startTime,
                                        DateTime? endTime, bool isAllDay) {
                                      samediDayTime = f.format(startTime!) +
                                          "-" +
                                          f.format(endTime!);
                                    },
                                  )
                                : const SizedBox(),
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: CheckboxListTile(
                                title: const Text("Dimanche",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                value: selectedDimanche,
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectedDimanche = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            selectedDimanche!
                                ? TimeIntervalPicker(
                                    endLimit: null,
                                    startLimit: null,
                                    onChanged: (DateTime? startTime,
                                        DateTime? endTime, bool isAllDay) {
                                      dimancheDayTime = f.format(startTime!) +
                                          "-" +
                                          f.format(endTime!);
                                    },
                                  )
                                : const SizedBox(),
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

  printIntAsDay(int day) {
    if (daySelect.contains(intDayToFrench(day))) {
      daySelect.remove(intDayToFrench(day));
    } else {
      daySelect.add(intDayToFrench(day));
    }
  }

  String intDayToFrench(int day) {
    if (day % 7 == DateTime.monday % 7) return 'Lundi';
    if (day % 7 == DateTime.tuesday % 7) return 'Mardi';
    if (day % 7 == DateTime.wednesday % 7) return 'Mercredi';
    if (day % 7 == DateTime.thursday % 7) return 'Jeudi';
    if (day % 7 == DateTime.friday % 7) return 'Vendredi';
    throw '🐞 This should never have happened: $day';
  }
}

class Days {
  String jour;
  bool selected;
  Days(this.jour, this.selected);
}
