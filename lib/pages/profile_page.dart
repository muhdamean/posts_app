import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/components/user_avatar.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/config/app_strings.dart';
import 'package:flutter_full_course/model/user.dart';
import 'package:flutter_full_course/styles/app_text.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  final User user;
  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.profile,
        actions: [
          PopupMenuButton<ProfileMenu>(
              onSelected: (value) {
                switch (value) {
                  case ProfileMenu.edit:
                    Navigator.of(context).pushNamed(AppRoutes.editProfile);
                    break;
                  case ProfileMenu.logout:
                    debugPrint('log out');
                    break;
                  default:
                }
              },
              icon: const Icon(Icons.more_vert_outlined),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text(AppStrings.edit),
                    value: ProfileMenu.edit,
                  ),
                  const PopupMenuItem(
                    child: Text(AppStrings.logout),
                    value: ProfileMenu.logout,
                  ),
                ];
              })
        ],
      ),
      body: Column(
        children: [
          UserAvatar(
            size: 40,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            '${user.firstname} ${user.lastname}', //'Mahdi Mirzadeh',
            style: AppText.header2,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Madagascar',
            style: AppText.subtitle3,
          ),
          const SizedBox(
            height: 24,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '472',
                    style: AppText.header2,
                  ),
                  Text(AppStrings.followers),
                ],
              ),
              Column(
                children: [
                  Text(
                    '119',
                    style: AppText.header2,
                  ),
                  Text(AppStrings.posts),
                ],
              ),
              Column(
                children: [
                  Text(
                    '850',
                    style: AppText.header2,
                  ),
                  Text(AppStrings.following),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 1,
            height: 24,
          ),
        ],
      ),
    );
  }
}
