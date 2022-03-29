/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:44:03 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-29 16:28:15
 */

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/blocs/theme/theme_bloc.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/utils/mapboxUtils.dart';
import 'package:positioncollect/src/utils/themes.dart';
import 'package:positioncollect/src/widgets/drawerItem.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key, required this.user, required this.mapBloc})
      : super(key: key);
  final User? user;
  final MapBloc? mapBloc;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Container(
              child: headerWidget(user!),
              height: 180,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  image: DecorationImage(
                      image: AssetImage("assets/images/navigation_icon_bg.png"),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0, 24, 0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  DrawerItem(
                    name: 'People',
                    icon: Icons.people,
                    onPressed: () => onItemPressed(context, index: 0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DrawerItem(
                      name: 'My Account',
                      icon: Icons.account_box_rounded,
                      onPressed: () => onItemPressed(context, index: 1)),
                  const SizedBox(
                    height: 10,
                  ),
                  DrawerItem(
                      name: 'Themes',
                      icon: Icons.light_mode_sharp,
                      onPressed: () => onItemPressed(context, index: 2)),
                  const SizedBox(
                    height: 10,
                  ),
                  DrawerItem(
                      name: 'Favourites',
                      icon: Icons.favorite_outline,
                      onPressed: () => onItemPressed(context, index: 3)),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                    height: 10,
                    color: Theme.of(context).backgroundColor == whiteColor
                        ? blackColor
                        : whiteColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DrawerItem(
                      name: 'Setting',
                      icon: Icons.settings,
                      onPressed: () => onItemPressed(context, index: 4)),
                  const SizedBox(
                    height: 10,
                  ),
                  DrawerItem(
                      name: S.of(context).logout,
                      icon: Icons.logout,
                      onPressed: () => onItemPressed(context, index: 5)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        _showPopup(context, mapBloc!);
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        BlocProvider.of<AuthBloc>(context).add(AuthLoggedOut());
        break;
    }
  }

  Widget headerWidget(User user) {
    var url = apiUrl + user.imageProfil!;
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: CachedNetworkImageProvider(url),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: whiteColor,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(user.phone!,
                    style: const TextStyle(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ],
    );
  }

  void _showPopup(BuildContext context, MapBloc mapBloc) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: greyColor,
            title: Center(child: Text(S.of(context).chooseTheme)),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(const ThemeEvent(AppTheme.darkTheme));
                  mapBloc.add(UpdateStyleEvent(mapThemes[0]['style']));
                  Navigator.pop(context, 'dark');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.light_mode_sharp,
                        size: 36.0, color: blackColor),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16.0),
                      child: Text(S.of(context).dark,
                          style: const TextStyle(color: blackColor)),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16.0),
                      child: Theme.of(context).backgroundColor == blackColor
                          ? const Icon(
                              Icons.check_circle,
                              color: green,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(const ThemeEvent(AppTheme.lightTheme));
                  mapBloc.add(UpdateStyleEvent(mapThemes[1]['style']));
                  Navigator.pop(context, 'light');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.light_mode_sharp,
                        size: 36.0, color: whiteColor),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16.0),
                      child: Text(
                        S.of(context).light,
                        style: const TextStyle(color: blackColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16.0),
                      child: Theme.of(context).backgroundColor == whiteColor
                          ? const Icon(
                              Icons.check_circle,
                              color: green,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
