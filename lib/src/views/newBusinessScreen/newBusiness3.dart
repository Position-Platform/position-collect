// ignore_for_file: file_names, deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 14:10:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-16 23:18:28
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/models/batiment_model/data.dart';
import 'package:positioncollect/src/models/etablissement_model/data.dart'
    as etablissement;
import 'package:positioncollect/src/models/sous_categories_model/datum.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/views/newBusinessScreen/newBusiness4.dart';
import 'package:universal_io/io.dart' as io;

class NewBusiness3 extends StatefulWidget {
  const NewBusiness3({Key? key, required this.batiment, required this.user})
      : super(key: key);
  final Data batiment;
  final User? user;
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
  Datum? sousCategory;

  @override
  void initState() {
    super.initState();
    _newBusinessBloc = BlocProvider.of<NewBusinessBloc>(context);
    _newBusinessBloc?.add(const GetSousCategories());
  }

  next() {
    etablissement.Data etablissements = etablissement.Data(
      idCommercial: widget.user!.commercial!.id,
      idBatiment: widget.batiment.id,
      indicationAdresse: indicationController.text,
      nom: nomEntrepriseController.text,
      etage: etageController.text,
    );

    if (_selectedFile != null && idSubCategory != null) {
      _newBusinessBloc
          ?.add(FormPage3(etablissements, _selectedFile!.path, idSubCategory!));
    } else {
      Fluttertoast.showToast(msg: "Remplissez tous les champs");
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
        if (state is SousCategoriesLoaded) {
          sousCategories = state.sousCategories;
        }
        if (state is FormError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Remplir tous les champs obligatoires"),
                    Icon(Icons.error)
                  ],
                ),
                backgroundColor: red,
                duration: const Duration(seconds: 4),
              ),
            );
        }
        if (state is GoToPage4) {
          Future.delayed(Duration.zero, () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider<NewBusinessBloc>(
                      create: (context) => getIt<NewBusinessBloc>(),
                      child: NewBusiness4(
                          etablissements: state.etablissements,
                          commodites: sousCategory!.categorie!.commodites!,
                          cover: File(state.coverPath),
                          idSousCatgorie: state.idSousCategorie,
                          user: widget.user))),
            );
          });
        }
      },
      child: BlocBuilder<NewBusinessBloc, NewBusinessState>(
        builder: (context, state) {
          if (state is SousCategoriesLoading) {
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
                            TypeAheadFormField(
                                textFieldConfiguration: TextFieldConfiguration(
                                    controller: sousCategorieController,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Choisir une sous catégorie',
                                        prefixIcon:
                                            Icon(Icons.category_outlined))),
                                suggestionsCallback: (pattern) {
                                  return sousCategories
                                      .where((sousCategory) => sousCategory.nom!
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()))
                                      .toList();
                                },
                                itemBuilder: (context, Datum suggestion) {
                                  return Container(
                                    color: whiteColor,
                                    child: ListTile(
                                      leading: SvgPicture.network(assetsUrl +
                                          suggestion.categorie!.logourl),
                                      title: Text(suggestion.nom!),
                                      subtitle:
                                          Text(suggestion.categorie!.nom!),
                                    ),
                                  );
                                },
                                transitionBuilder:
                                    (context, suggestionsBox, controller) {
                                  return suggestionsBox;
                                },
                                onSuggestionSelected: (Datum suggestion) {
                                  sousCategorieController.text =
                                      suggestion.nom!;
                                  selectedSubCategory = suggestion.nom!;
                                  idSubCategory = suggestion.id!;
                                  sousCategory = suggestion;
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
