/*
 * @Author: Boris Gautier 
 * @Date: 2022-03-31 11:12:59 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-19 17:38:03
 */
// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:positioncollect/src/models/batiment_model/etablissement.dart';
import 'package:positioncollect/src/models/etablissement_model/data.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/widgets/widgets.dart';

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

  @override
  void initState() {
    super.initState();
    imgList.add(apiUrl + widget.etablissement.cover!);
    for (var i = 0; i < widget.etablissement.images!.length; i++) {
      imgList.add(apiUrl + widget.etablissement.images![i].imageUrl!);
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
      idCommercial: widget.etablissement.idCommercial!,
      indicationAdresse: widget.etablissement.indicationAdresse,
      osmId: widget.etablissement.osmId,
      phone: widget.etablissement.phone,
      services: widget.etablissement.services,
      updatedAt: widget.etablissement.updatedAt,
      siteInternet: widget.etablissement.siteInternet,
      whatsapp1: widget.etablissement.whatsapp1,
      whatsapp2: widget.etablissement.whatsapp2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double bannerWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = MediaQuery.of(context).size.width * 3 / 4;
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: ListView(
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
          buildEtablissementTop(widget.etablissement),
          divider2(),
          widget.etablissement.description != null
              ? buildAddressDetail(widget.etablissement.description!)
              : const SizedBox(),
          const SizedBox(height: 16),
          buildOpeningHours(widget.etablissement),
          editEtablissementButton(
              context, etablissement!, widget.user, widget.position),
        ],
      ),
    );
  }
}
