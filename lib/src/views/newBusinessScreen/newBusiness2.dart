// ignore_for_file: file_names, deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 14:10:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-14 05:03:25
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/widgets/buttonForm.dart';
import 'package:universal_io/io.dart' as io;

class NewBusiness2 extends StatefulWidget {
  const NewBusiness2({Key? key}) : super(key: key);

  @override
  _NewBusiness2State createState() => _NewBusiness2State();
}

class _NewBusiness2State extends State<NewBusiness2> {
  NewBusinessBloc? newBusinessBloc;
  TextEditingController indicationController = TextEditingController();

  File? _image;
  final _picker = ImagePicker();
  final _cropper = ImageCropper();

  File? _selectedFile;

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
              title: Text(S.of(context).addEtablissement + " (2)",
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
