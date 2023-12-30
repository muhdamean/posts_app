import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/styles/app_text.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: 'Profile',
        actions: [
          PopupMenuButton<ProfileMenu>(
              onSelected: (value) {
                switch (value) {
                  case ProfileMenu.edit:
                    debugPrint('edit');
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
                    child: Text('Edit'),
                    value: ProfileMenu.edit,
                  ),
                  const PopupMenuItem(
                    child: Text('Log out'),
                    value: ProfileMenu.logout,
                  ),
                ];
              })
        ],
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Image.asset(
              'assets/temp/user1.png',
              width: 90,
              height: 90,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Mahdi Mirzadeh',
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
                  Text('Followers'),
                ],
              ),
              Column(
                children: [
                  Text(
                    '119',
                    style: AppText.header2,
                  ),
                  Text('Posts'),
                ],
              ),
              Column(
                children: [
                  Text(
                    '850',
                    style: AppText.header2,
                  ),
                  Text('Following'),
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
