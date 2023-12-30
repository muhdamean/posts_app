import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/post_item.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> users = [];

  @override
  Widget build(BuildContext context) {
    mockUsersFromServer();
    return Scaffold(
        appBar: Toolbar(
          title: '5minuteflutter',
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/ic_location.svg'),
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
