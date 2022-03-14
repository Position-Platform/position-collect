// ignore_for_file: file_names, deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 14:10:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-14 15:34:53
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/models/sous_categories_model/datum.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/widgets/buttonForm.dart';
import 'package:universal_io/io.dart' as io;

class NewBusiness3 extends StatefulWidget {
  const NewBusiness3({Key? key}) : super(key: key);
  @override
  _NewBusiness3State createState() => _NewBusiness3State();
}

class _NewBusiness3State extends State<NewBusiness3> {
  NewBusinessBloc? _newBusinessBloc;

  TextEditingController indicationController = TextEditingController();
  TextEditingController nomEntrepriseController = TextEditingController();
  TextEditingController etageController = TextEditingController();
  TextEditingController sousCategorieController = TextEditingController();

  File? _image;
  final _picker = ImagePicker();
  final _cropper = ImageCropper();

  File? _selectedFile;

  String? selectedSubCategory;
  int? idSubCategory;

  List<Datum> sousCategories = [];

  @override
  void initState() {
    super.initState();
    _newBusinessBloc = BlocProvider.of<NewBusinessBloc>(context);
    _newBusinessBloc?.add(const GetSousCategories());
  }

  next() {}

  back() {}

  @override
  Widget build(BuildContext context) {
    changeStatusColor(transparent);

    return BlocListener<NewBusinessBloc, NewBusinessState>(
      listener: (context, state) {
        if (state is SousCategoriesLoaded) {
          sousCategories = state.sousCategories;
        }
      },
      child: BlocBuilder<NewBusinessBloc, NewBusinessState>(
        builder: (context, state) {
          if (state is PageLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: primaryColor,
                  valueColor: AlwaysStoppedAnimation<Color>(accentPrimaryColor),
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: whiteColor,
              ),
              systemOverlayStyle: SystemUiOverlayStyle.light,
              centerTitle: true,
              title: Text(S.of(context).addEtablissement + " (3)",
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
                        TypeAheadFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                                controller: sousCategorieController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Choisir une sous catégorie',
                                    prefixIcon: Icon(Icons.category_outlined))),
                            suggestionsCallback: (pattern) {
                              return sousCategories;
                            },
                            itemBuilder: (context, Datum suggestion) {
                              return Container(
                                color: whiteColor,
                                child: ListTile(
                                  leading: Image.network(
                                      apiUrl + suggestion.categorie!.logourl),
                                  title: Text(suggestion.nom!),
                                  subtitle: Text(suggestion.categorie!.nom!),
                                ),
                              );
                            },
                            transitionBuilder:
                                (context, suggestionsBox, controller) {
                              return suggestionsBox;
                            },
                            onSuggestionSelected: (Datum suggestion) {
                              sousCategorieController.text = suggestion.nom!;
                              selectedSubCategory = suggestion.nom!;
                              idSubCategory = suggestion.id!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please select a Sub Category';
                              }
                              return null;
                            },
                            onSaved: (value) => {
                                  selectedSubCategory = value,
                                }),
                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text("Image Principale de l'etablissement"),
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

  Widget _getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile!,
        width: MediaQuery.of(context).size.width - 16,
        height: 150,
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
