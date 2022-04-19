// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-03-29 00:45:06 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-19 16:42:27
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:positioncollect/src/models/batiment_model/data.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/cache_image_network.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/widgets/widgets.dart';

class BatimentDetail extends StatefulWidget {
  const BatimentDetail(
      {Key? key,
      required this.batiment,
      required this.user,
      required this.position})
      : super(key: key);
  final Data batiment;
  final User user;
  final Position position;
  @override
  State<BatimentDetail> createState() => _BatimentDetailState();
}

class _BatimentDetailState extends State<BatimentDetail> {
  late ScrollController _scrollController;
  bool _showAppBar = false;

  final f = DateFormat('dd-mm-yyyy');

  @override
  void initState() {
    setupAnimateAppbar();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void setupAnimateAppbar() {
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.hasClients &&
            _scrollController.offset >
                (MediaQuery.of(context).size.width * 3 / 4) - 80) {
          setState(() {
            _showAppBar = true;
          });
        } else {
          setState(() {
            _showAppBar = false;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final double bannerWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = MediaQuery.of(context).size.width * 3 / 4;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: kToolbarHeight + 22),
            child: ListView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              children: [
                buildCacheNetworkImage(
                    width: bannerWidth,
                    height: bannerHeight,
                    url: apiUrl + widget.batiment.image),
                buildBatimentTop(widget.batiment),
                divider1(),
                buildNewMenu(widget.batiment, widget.user, widget.position),
              ],
            ),
          ),
          Opacity(
            opacity: _showAppBar ? 1 : 0,
            child: SizedBox(
              height: 80,
              child: AppBar(
                iconTheme: const IconThemeData(
                  color: blackColor,
                ),
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                centerTitle: true,
                title: Text(widget.batiment.nom!,
                    style: const TextStyle(fontSize: 18, color: blackColor)),
                backgroundColor: whiteColor,
              ),
            ),
          ),
          editBatimentButton(
              context, widget.batiment, widget.user, widget.position),
        ],
      ),
    );
  }
}
