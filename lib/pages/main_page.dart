import 'package:flutter/material.dart';
import 'package:flutter_full_course/pages/home_page.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentindex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/ic_home.svg'),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/ic_favorite.svg'),
                label: 'Favorite'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/ic_messages.svg'),
                label: 'Add Post'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/ic_messages.svg'),
                label: 'Messages'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/ic_user.svg'),
                label: 'User'),
          ],
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.amber,
        ));
  }

  final pages = [
     HomePage(),
    const Center(
      child: Text('Favorite'),
    ),
    const Center(
      child: Text('Add Post'),
    ),
    const Center(
      child: Text('Messages'),
    ),
    const Center(
      child: Text('User'),
    ),
  ];
}
