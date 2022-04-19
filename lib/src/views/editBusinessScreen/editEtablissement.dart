// ignore_for_file: file_names, must_be_immutable, deprecated_member_use

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
import 'package:positioncollect/src/models/etablissement_model/data.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/views/mapScreen/mapPage.dart';
import 'package:universal_io/io.dart' as io;

class EditEtablissement extends StatefulWidget {
  EditEtablissement(
      {Key? key,
      required this.etablissement,
      required this.user,
      required this.position})
      : super(key: key);

  Data etablissement;
  User user;
  Position position;

  @override
  State<EditEtablissement> createState() => _EditEtablissementState();
}

class _EditEtablissementState extends State<EditEtablissement> {
  EditBusinessBloc? editBusinessBloc;

  TextEditingController nomEntrepriseController = TextEditingController();
  TextEditingController etageController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  TextEditingController siteInternetController = TextEditingController();
  TextEditingController indicationAdresseController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController servicesController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController whatsapp1Controller = TextEditingController();
  TextEditingController whatsapp2Controller = TextEditingController();
  TextEditingController ameliorationController = TextEditingController();

  File? _image;
  final _picker = ImagePicker();
  final _cropper = ImageCropper();

  File? _selectedFile;

  @override
  void initState() {
    super.initState();
    editBusinessBloc = BlocProvider.of<EditBusinessBloc>(context);
    nomEntrepriseController.text = widget.etablissement.nom!;
    etageController.text = widget.etablissement.etage!;
    postalController.text = widget.etablissement.codePostal ?? '';
    siteInternetController.text = widget.etablissement.siteInternet ?? '';
    indicationAdresseController.text =
        widget.etablissement.indicationAdresse ?? '';
    descriptionController.text = widget.etablissement.description ?? '';
    servicesController.text = widget.etablissement.services!;
    phoneController.text = widget.etablissement.phone!;
    whatsapp1Controller.text = widget.etablissement.whatsapp1!;
    whatsapp2Controller.text = widget.etablissement.whatsapp2 ?? '';
    ameliorationController.text = widget.etablissement.ameliorations ?? '';
  }

  next() {
    widget.etablissement.nom = nomEntrepriseController.text;
    widget.etablissement.etage = etageController.text;
    widget.etablissement.codePostal = postalController.text;
    widget.etablissement.siteInternet = siteInternetController.text;
    widget.etablissement.indicationAdresse = indicationAdresseController.text;
    widget.etablissement.description = descriptionController.text;
    widget.etablissement.services = servicesController.text;
    widget.etablissement.phone = phoneController.text;
    widget.etablissement.whatsapp1 = whatsapp1Controller.text;
    widget.etablissement.whatsapp2 = whatsapp2Controller.text;
    widget.etablissement.ameliorations = ameliorationController.text;

    if (_selectedFile != null) {
      editBusinessBloc!.add(UpdateEtablissement(widget.etablissement,
          coverPath: _selectedFile!.path));
    } else {
      editBusinessBloc!.add(UpdateEtablissement(widget.etablissement));
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
                    Text("Mise à jour de l'etablissement..."),
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
                    Text("Erreur lors de la mise à jour de l'etablissement"),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: red,
              ),
            );
        }
        if (state is EtablissementUpdated) {
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
                              controller: nomEntrepriseController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.characters,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Nom de l'entreprise",
                                  prefixIcon: Icon(Icons.location_on_rounded)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: etageController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Numero Etage',
                                  prefixIcon: Icon(Icons.location_on_rounded)),
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
                              height: 15,
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
                            const Center(
                              child:
                                  Text("Image Principale de l'etablissement"),
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
                                        "Valider",
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
    } else if (widget.etablissement.cover != null) {
      return Image.network(
        apiUrl + widget.etablissement.cover!,
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
