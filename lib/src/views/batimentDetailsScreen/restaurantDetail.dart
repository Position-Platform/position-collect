/*
 * @Author: Boris Gautier 
 * @Date: 2022-03-31 11:12:59 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-21 17:03:26
 */
// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:positioncollect/src/blocs/edit_business/edit_business_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/models/batiment_model/etablissement.dart';
import 'package:positioncollect/src/models/etablissement_model/data.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/views/editBusinessScreen/editEtablissement.dart';

class RestaurantDetail extends StatefulWidget {
  const RestaurantDetail(
      {Key? key,
      required this.etablissement,
      required this.user,
      required this.position})
      : super(key: key);
  final Etablissement etablissement;
  final User user;
  final Position position;

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  final List<String> imgList = [];
  Data? etablissement;
  int? idUser;
  String? imageProfile;
  String? userName;

  @override
  void initState() {
    super.initState();
    imgList.add(Configs.apiUrl + widget.etablissement.cover!);
    for (var i = 0; i < widget.etablissement.images!.length; i++) {
      imgList.add(Configs.apiUrl + widget.etablissement.images![i].imageUrl!);
    }
    etablissement = Data(
      id: widget.etablissement.id,
      nom: widget.etablissement.nom,
      description: widget.etablissement.description,
      cover: widget.etablissement.cover,
      ameliorations: widget.etablissement.ameliorations,
      codePostal: widget.etablissement.codePostal,
      createdAt: widget.etablissement.createdAt,
      etage: widget.etablissement.etage,
      idBatiment: widget.etablissement.idBatiment!,
      idCommercial: widget.etablissement.idCommercial,
      indicationAdresse: widget.etablissement.indicationAdresse,
      osmId: widget.etablissement.osmId,
      phone: widget.etablissement.phone,
      services: widget.etablissement.services,
      updatedAt: widget.etablissement.updatedAt,
      siteInternet: widget.etablissement.siteInternet,
      whatsapp1: widget.etablissement.whatsapp1,
      whatsapp2: widget.etablissement.whatsapp2,
    );

    idUser = widget.user.id ?? widget.etablissement.commercial!.idUser;
    imageProfile = widget.user.imageProfil ??
        widget.etablissement.commercial!.user!.imageProfil;
    userName = widget.user.name ?? widget.etablissement.commercial!.user!.name;
  }

  @override
  Widget build(BuildContext context) {
    final double bannerWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = MediaQuery.of(context).size.width * 3 / 4;
    return Hero(
        tag: widget.etablissement.id!,
        child: Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: blackColor,
            ),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            centerTitle: true,
            title: Text(widget.etablissement.nom!,
                style: const TextStyle(fontSize: 18, color: blackColor)),
            backgroundColor: whiteColor,
            bottom: PreferredSize(
                child: Container(
                  color: Colors.grey[100],
                  height: 1.0,
                ),
                preferredSize: const Size.fromHeight(1.0)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 260,
                  child: Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          enableInfiniteScroll: true,
                        ),
                        items: imgList
                            .map((item) => Center(
                                    child: Image.network(
                                  item,
                                  fit: BoxFit.cover,
                                  width: bannerWidth,
                                  height: bannerHeight,
                                )))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          widget.etablissement.nom!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Site Internet : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.etablissement.siteInternet ?? "",
                                    style: const TextStyle(
                                        color: greyAccent, fontSize: 14)),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Phone : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.etablissement.phone!,
                                    style: const TextStyle(
                                        color: greyAccent, fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Code Postal : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.etablissement.codePostal ?? "",
                                    style: const TextStyle(
                                        color: greyAccent, fontSize: 14)),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Whatsapp : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.etablissement.whatsapp1!,
                                    style: const TextStyle(
                                        color: greyAccent, fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Services : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.etablissement.services!,
                                    style: const TextStyle(
                                        color: greyAccent, fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 30.0, bottom: 10.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: CachedNetworkImageProvider(
                                    Configs.apiUrl + imageProfile!),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ajouté le " +
                                          convertCreatedAt(
                                              widget.etablissement.createdAt!) +
                                          " Par ",
                                      style: const TextStyle(
                                          color: primaryColor, fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      userName!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            const Text("Description",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18)),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              widget.etablissement.description ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text("Heures d'ouverture",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18)),
                            const SizedBox(
                              height: 8,
                            ),
                            ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: widget.etablissement.horaires!.length,
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              widget.etablissement
                                                  .horaires![index].jour!,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: greyAccent,
                                                  fontWeight: FontWeight.w600)),
                                          Text(
                                              widget
                                                  .etablissement
                                                  .horaires![index]
                                                  .plageHoraire!,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: greyAccent,
                                              )),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Container(
                              height: 80,
                            )
                          ],
                        ),
                      ]),
                )
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
              height: 73,
              child: BottomAppBar(
                  color: Colors.white,
                  elevation: 0.0,
                  child: FittedBox(
                      fit: BoxFit.none,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Future.delayed(Duration.zero, () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider<EditBusinessBloc>(
                                              create: (context) =>
                                                  getIt<EditBusinessBloc>(),
                                              child: EditEtablissement(
                                                etablissement: etablissement!,
                                                user: widget.user,
                                                position: widget.position,
                                              ))),
                                );
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 6.0),
                              height: 46,
                              width: 210,
                              decoration: BoxDecoration(
                                color: accentPrimaryColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: const Text(
                                "Modifier cette entreprise",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ))))),
        ));
  }

  String convertCreatedAt(String createdAt) {
    var date = DateTime.parse(createdAt);
    return DateFormat('dd/MM/yyyy').format(date).toString();
  }
}
