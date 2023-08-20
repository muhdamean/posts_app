import 'package:flutter/material.dart';
import 'package:flutter_full_course/styles/app_colors.dart';
import 'package:flutter_full_course/styles/app_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          title: const Text('5minuteflutter'),
          centerTitle: false,
          actions: const [
            Icon(Icons.location_on_outlined),
          ],
        ),
        body: ListView(
          children: mockUsersFromServer(),
        ));
  }

  Widget _userItem() {
    return Row(
      children: [
        Image.asset(
          'assets/temp/user1.jpg',
          width: 40,
          height: 40,
        ),
        const SizedBox(
          width: 16,
        ),
        const Text('Doe Fernandez', style: AppText.subtitle3,),
      ],
    );
  }

  List<Widget> mockUsersFromServer() {
    List<Widget> users = [];
    for (var i = 0; i < 500; i++) {
      users.add(_userItem());
    }
    return users;
  }
}
