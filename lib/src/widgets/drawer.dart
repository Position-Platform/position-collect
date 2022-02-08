/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:44:03 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-08 05:49:48
 */
import 'package:flutter/material.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/widgets/drawerItem.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key, required this.user}) : super(key: key);
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: whiteColor,
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
                      name: 'Chats',
                      icon: Icons.message_outlined,
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
                  const Divider(
                    thickness: 1,
                    height: 10,
                    color: blackColor,
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
                      name: 'Log out',
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
    }
  }

  Widget headerWidget(User user) {
    var url = apiUrl + user.commercial!.imageProfil!;
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
              backgroundImage: NetworkImage(url),
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
}
