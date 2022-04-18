// ignore_for_file: file_names, deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-04-03 15:22:57 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-18 17:34:08
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/edit_business/edit_business_bloc.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/models/batiment_model/data.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/views/mapScreen/mapPage.dart';
import 'package:universal_io/io.dart' as io;
import 'package:positioncollect/src/utils/tools.dart';

class EditBatiment extends StatefulWidget {
  const EditBatiment(
      {Key? key,
      required this.batiment,
      required this.user,
      required this.position})
      : super(key: key);
  final Data batiment;
  final User user;
  final Position position;
  @override
  State<EditBatiment> createState() => _EditBatimentState();
}

class _EditBatimentState extends State<EditBatiment> {
  EditBusinessBloc? editBusinessBloc;

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

  File? _image;
  final _picker = ImagePicker();
  final _cropper = ImageCropper();

  File? _selectedFile;

  Position? position;

  @override
  void initState() {
    super.initState();
    editBusinessBloc = BlocProvider.of<EditBusinessBloc>(context);
    nameController.text = widget.batiment.nom!;
    niveauController.text = widget.batiment.nombreNiveau!;
    coordonneesController.text =
        widget.batiment.longitude! + "," + widget.batiment.latitude!;
    quartierController.text = widget.batiment.quartier!;
    indicationController.text = widget.batiment.indication!;
    ville = widget.batiment.ville!;
  }

  next() {
    var coordonnees = coordonneesController.text.split(",");
    widget.batiment.longitude = coordonnees[0];
    widget.batiment.latitude = coordonnees[1];
    widget.batiment.nom = nameController.text;
    widget.batiment.nombreNiveau = niveauController.text;
    widget.batiment.quartier = quartierController.text;
    widget.batiment.indication = indicationController.text;
    widget.batiment.ville = ville;

    if (_selectedFile != null) {
      editBusinessBloc!
          .add(UpdateBatiment(widget.batiment, imagePath: _selectedFile!.path));
    } else {
      editBusinessBloc!.add(UpdateBatiment(widget.batiment));
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
    return BlocListener<EditBusinessBloc, EditBusinessState>(
      listener: (context, state) {
        if (state is EditBusinessLoading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Mise à jour du batiment..."),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state is EditBusinessError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Erreur lors de la mise à jour du batiment"),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: red,
              ),
            );
        }
        if (state is BatimentUpdated) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => BlocProvider<MapBloc>(
                        create: (context) => getIt<MapBloc>(),
                        child: MapPage(
                          position: widget.position,
                          user: widget.user,
                        ),
                      )),
              (Route<dynamic> route) => false);
        }
      },
      child: BlocBuilder<EditBusinessBloc, EditBusinessState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: whiteColor,
              ),
              systemOverlayStyle: SystemUiOverlayStyle.light,
              centerTitle: true,
              title: Text(S.of(context).editEtablissement,
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
                              height: 15,
                            ),
                            const Center(
                              child: Text("Image du batiment"),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  _getImageWidget(),
                                  const SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Icon(
                                              Icons.camera_alt,
                                              color: greyColor,
                                              size: 40,
                                            ),
                                            SizedBox(width: 10),
                                            Text('Camera'),
                                          ],
                                        ),
                                        onTap: () {
                                          _askPermissionCamera();
                                        },
                                      ),
                                      Container(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Icon(
                                              Icons.photo,
                                              color: greyColor,
                                              size: 40,
                                            ),
                                            SizedBox(width: 10),
                                            Text('Gallery'),
                                          ],
                                        ),
                                        onTap: () {
                                          if (io.Platform.isIOS) {
                                            _askPermissionPhotos();
                                          } else {
                                            _askPermissionStorage();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                                      child: const Text(
                                        "Sauvegarder",
                                        style: TextStyle(
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

  Widget _getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile!,
        width: MediaQuery.of(context).size.width - 16,
        fit: BoxFit.fill,
      );
    } else if (widget.batiment.image != null) {
      return Image.network(
        apiUrl + widget.batiment.image,
        width: MediaQuery.of(context).size.width - 16,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset(
        'assets/images/placeholder.jpg',
        width: MediaQuery.of(context).size.width - 16,
        height: 150,
        fit: BoxFit.fill,
      );
    }
  }

  void _askPermissionCamera() {
    requestPermission(Permission.camera).then(_onStatusRequestedCamera);
  }

  void _askPermissionStorage() {
    requestPermission(Permission.storage).then(_onStatusRequested);
  }

  void _askPermissionPhotos() {
    requestPermission(Permission.photos).then(_onStatusRequested);
  }

  void _onStatusRequested(status) {
    if (status != PermissionStatus.granted) {
      if (io.Platform.isIOS) {
        openAppSettings();
      } else {
        if (status == PermissionStatus.permanentlyDenied) {
          openAppSettings();
        }
      }
    } else {
      _getImage(ImageSource.gallery);
    }
  }

  Future requestPermission(Permission permission) async {
    final result = await permission.request();
    return result;
  }

  void _onStatusRequestedCamera(status) {
    if (status != PermissionStatus.granted) {
      if (io.Platform.isIOS) {
        openAppSettings();
      } else {
        if (status == PermissionStatus.permanentlyDenied) {
          openAppSettings();
        }
      }
    } else {
      _getImage(ImageSource.camera);
    }
  }

  void _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });

    if (_image != null) {
      File? cropped = await _cropper.cropImage(
          sourcePath: _image!.path,
          compressQuality: 100,
          maxWidth: 1080,
          maxHeight: 1080,
          cropStyle: CropStyle.rectangle,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: const AndroidUiSettings(
            initAspectRatio: CropAspectRatioPreset.original,
            toolbarColor: Colors.white,
            toolbarTitle: 'Edit Images',
            statusBarColor: primaryColor,
            activeControlsWidgetColor: greyAccent,
            cropFrameColor: Colors.white,
            cropGridColor: Colors.white,
            toolbarWidgetColor: greyAccent,
            backgroundColor: Colors.white,
          ));

      setState(() {
        if (cropped != null) {
          if (_selectedFile != null && _selectedFile!.existsSync()) {
            _selectedFile!.deleteSync();
          }
          _selectedFile = cropped;
        }
        // delete image camera
        if (source.toString() == 'ImageSource.camera' && _image!.existsSync()) {
          _image!.deleteSync();
        }

        _image = null;
      });
    }
  }
}
