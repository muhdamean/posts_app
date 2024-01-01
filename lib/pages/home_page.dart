import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/post_item.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/config/app_icons.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/config/app_strings.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> users = [];

  @override
  Widget build(BuildContext context) {
    mockUsersFromServer();
    return Scaffold(
        appBar: Toolbar(
          title: AppStrings.appName,
          actions: [
            IconButton(
              onPressed: ()=>Navigator.of(context).pushNamed(AppRoutes.nearby),
              icon: SvgPicture.asset(AppIcons.icLocation),
            ),
          ],
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return PostItem(
              user: users[index],
            );
          },
          itemCount: users.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 24,
            );
          },
        ));
  }

  mockUsersFromServer() {
    for (var i = 0; i < 100; i++) {
      users.add('User number $i');
    }
    return users;
  }

  // List<Widget> mockUsersFromServer() {
  //   List<Widget> users = [];
  //   for (var i = 0; i < 500; i++) {
  //     users.add(PostItem());
  //   }
  //   return users;
  // }
}
