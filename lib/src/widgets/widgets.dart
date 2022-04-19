// ignore_for_file: library_prefixes

/*
 * @Author: Boris Gautier 
 * @Date: 2022-03-29 19:46:50 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-19 17:52:30
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:positioncollect/src/blocs/edit_business/edit_business_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/models/batiment_model/etablissement.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/cache_image_network.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/utils/sizes.dart';
import 'package:positioncollect/src/models/batiment_model/data.dart';
import 'package:positioncollect/src/models/etablissement_model/data.dart'
    as etablissementData;
import 'package:positioncollect/src/views/batimentDetailsScreen/restaurantDetail.dart';
import 'package:positioncollect/src/views/editBusinessScreen/editBatiment.dart';
import 'package:positioncollect/src/views/editBusinessScreen/editEtablissement.dart';

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = transparent,
    Color? bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? greyColor,
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

List<BoxShadow> defaultBoxShadow({
  Color? shadowColor,
  double? blurRadius,
  double? spreadRadius,
  Offset offset = const Offset(0.0, 0.0),
}) {
  return [
    BoxShadow(
      color: shadowColor ?? shadowColorGlobal,
      blurRadius: blurRadius ?? defaultBlurRadius,
      spreadRadius: spreadRadius ?? defaultSpreadRadius,
      offset: offset,
    )
  ];
}

Widget text(
  String? text, {
  var fontSize = textSizeLargeMedium,
  Color? textColor,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: textColor ?? blackColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

// Secondary Text Style
TextStyle secondaryTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textSecondarySizeGlobal,
    color: color ?? textSecondaryColorGlobal,
    fontWeight: weight ?? fontWeightSecondaryGlobal,
    fontFamily: fontFamily ?? fontFamilySecondaryGlobal,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  );
}

Widget divider() {
  return const Padding(
    padding: EdgeInsets.only(top: 10.0, bottom: 10),
    child: Divider(
      color: viewColor,
      height: 0.5,
    ),
  );
}

Widget divider2() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    child: Divider(
      height: 32,
      color: Colors.grey[400],
    ),
  );
}

Widget buildBatimentTop(Data batiment) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Batiment',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12)),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(batiment.nom ?? batiment.codeBatiment!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
      ),
      const SizedBox(height: 8),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text(
              "Nombre de Niveaux : ",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Text(batiment.nombreNiveau!,
                style: const TextStyle(color: greyAccent, fontSize: 13)),
          ],
        ),
      ),
      const SizedBox(height: 8),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text(
              "Commune : ",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Text(batiment.commune!,
                style: const TextStyle(color: greyAccent, fontSize: 13)),
          ],
        ),
      ),
      const SizedBox(height: 8),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text(
              "Ville : ",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Text(batiment.ville!,
                style: const TextStyle(color: greyAccent, fontSize: 13)),
          ],
        ),
      ),
      const SizedBox(height: 8),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text(
              "Rue : ",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Text(batiment.rue!,
                style: const TextStyle(color: greyAccent, fontSize: 13)),
          ],
        ),
      ),
      const SizedBox(height: 8),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text(
              "Quartier : ",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Text(batiment.quartier!,
                style: const TextStyle(color: greyAccent, fontSize: 13)),
          ],
        ),
      ),
      const SizedBox(height: 8),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text(
              "Ajouté Par : ",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Text(batiment.etablissements![0].commercial!.user!.name!,
                style: const TextStyle(color: greyAccent, fontSize: 13)),
          ],
        ),
      ),
    ],
  );
}

Widget divider1() {
  return Container(
    height: 8,
    color: Colors.grey[100],
  );
}

Widget buildNewMenu(Data batiment, User user, Position position) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: const Text('Liste des Entreprises',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: blackColor)),
      ),
      ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: batiment.etablissements!.length,
        padding: const EdgeInsets.symmetric(vertical: 0),
        itemBuilder: (BuildContext context, int index) {
          return buildEtablissementDetailList(
              context, index, batiment.etablissements!, user, position);
        },
      )
    ],
  );
}

Widget editBatimentButton(
    BuildContext context, Data batiment, User user, Position position) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
          color: Colors.grey[100]!,
        )),
      ),
      child: GestureDetector(
        onTap: () {
          Future.delayed(Duration.zero, () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider<EditBusinessBloc>(
                      create: (context) => getIt<EditBusinessBloc>(),
                      child: EditBatiment(
                        batiment: batiment,
                        user: user,
                        position: position,
                      ))),
            );
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: kToolbarHeight - 10,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: accentPrimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Modifier ce batiment',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget editEtablissementButton(BuildContext context,
    etablissementData.Data etablissement, User user, Position position) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
          color: Colors.grey[100]!,
        )),
      ),
      child: GestureDetector(
        onTap: () {
          Future.delayed(Duration.zero, () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider<EditBusinessBloc>(
                      create: (context) => getIt<EditBusinessBloc>(),
                      child: EditEtablissement(
                        etablissement: etablissement,
                        user: user,
                        position: position,
                      ))),
            );
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: kToolbarHeight - 10,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: accentPrimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Modifier cette entreprise',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildEtablissementDetailList(
    context, index, List<Etablissement> data, User user, Position position) {
  final double boxImageSize = (MediaQuery.of(context).size.width / 4);
  return Column(
    children: [
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantDetail(
                etablissement: data[index],
                position: position,
                user: user,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  child: buildCacheNetworkImage(
                      width: boxImageSize,
                      height: boxImageSize,
                      url: apiUrl + data[index].cover!)),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(data[index].nom!,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    data[index].description != null
                        ? Text(data[index].description,
                            style: const TextStyle(
                                fontSize: 14, color: greyAccent),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis)
                        : const SizedBox(),
                    const SizedBox(height: 8),
                    int.parse(data[index].etage!) != 0
                        ? Text("Numéro étage :" + data[index].etage!,
                            style: const TextStyle(
                                fontSize: 14, color: accentPrimaryColor),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis)
                        : const Text("Rez de Chaussée",
                            style: TextStyle(
                                fontSize: 14, color: accentPrimaryColor),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      (index == data.length - 1)
          ? Wrap()
          : Divider(
              height: 0,
              color: Colors.grey[400],
            )
    ],
  );
}

Widget buildEtablissementTop(Etablissement etablissement) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Etablissement',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12)),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(etablissement.nom!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
      ),
      const SizedBox(height: 8),
      etablissement.codePostal != null
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    "Code Postal : ",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(etablissement.codePostal!,
                      style: const TextStyle(color: greyAccent, fontSize: 13)),
                ],
              ),
            )
          : const SizedBox(),
      const SizedBox(height: 8),
      etablissement.siteInternet != null
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    "Site Internet : ",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(etablissement.siteInternet!,
                      style: const TextStyle(color: greyAccent, fontSize: 13)),
                ],
              ),
            )
          : const SizedBox(),
      const SizedBox(height: 8),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text(
              "Phone : ",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Text(etablissement.phone!,
                style: const TextStyle(color: greyAccent, fontSize: 13)),
          ],
        ),
      ),
      const SizedBox(height: 8),
      etablissement.whatsapp2 != null
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    "Whatsapp : ",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      etablissement.whatsapp1! + "/" + etablissement.whatsapp2!,
                      style: const TextStyle(color: greyAccent, fontSize: 13)),
                ],
              ),
            )
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    "Whatsapp : ",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(etablissement.whatsapp1!,
                      style: const TextStyle(color: greyAccent, fontSize: 13)),
                ],
              ),
            ),
      const SizedBox(height: 8),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text(
              "Services : ",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Text(etablissement.services!,
                style: const TextStyle(color: greyAccent, fontSize: 13)),
          ],
        ),
      ),
      const SizedBox(height: 8),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text(
              "Ajouté Par : ",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Text(etablissement.commercial!.user!.name!,
                style: const TextStyle(color: greyAccent, fontSize: 13)),
          ],
        ),
      ),
    ],
  );
}

Widget buildAddressDetail(String description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Text('Description',
            style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(description,
            style: const TextStyle(fontSize: 13, color: greyAccent)),
      )
    ],
  );
}

Widget buildOpeningHours(Etablissement etablissement) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Text("Heures d'ouverture",
            style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      const SizedBox(height: 8),
      ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: etablissement.horaires!.length,
        padding: const EdgeInsets.symmetric(vertical: 0),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(etablissement.horaires![index].jour!,
                        style: const TextStyle(
                            fontSize: 13,
                            color: greyAccent,
                            fontWeight: FontWeight.w600)),
                    Text(etablissement.horaires![index].plageHoraire!,
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
      )
    ],
  );
}
