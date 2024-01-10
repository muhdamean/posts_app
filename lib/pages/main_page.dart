import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/new_post_modal.dart';
import 'package:flutter_full_course/config/app_icons.dart';
import 'package:flutter_full_course/config/app_strings.dart';
import 'package:flutter_full_course/pages/chat_page.dart';
import 'package:flutter_full_course/pages/home_page.dart';
import 'package:flutter_full_course/pages/profile_page.dart';
import 'package:flutter_full_course/styles/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  //final User user;
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Menus currentIndex = Menus.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex.index],
      bottomNavigationBar: MyBottomNavigation(
        currentIndex: currentIndex,
        onTap: (value) {
          if (value == Menus.add) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return NewPostModal();
              },
            );
            return;
          }
          setState(() {
            debugPrint(value.index.toString());
            currentIndex = value;
          });
        },
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(AppIcons.icHome),
      //       label: AppStrings.home,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(AppIcons.icFavorite),
      //       label: AppStrings.favorites,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(AppIcons.icAdd),
      //       label: AppStrings.add,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(AppIcons.icMessage),
      //       label: AppStrings.messages,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(AppIcons.icUser),
      //       label: AppStrings.user,
      //     ),
      //   ],
      //   currentIndex: currentIndex,
      //   onTap: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      //   type: BottomNavigationBarType.fixed,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   backgroundColor: Colors.amber,
      // ),
    );
  }

  final pages = [
    const HomePage(),
    const Center(
      child: Text(AppStrings.favorites),
    ),
    const Center(
      child: Text(AppStrings.posts),
    ),
    ChatPage(),
    const ProfilePage(),
  ];
}

enum Menus {
  home,
  favorite,
  add,
  message,
  user,
}

class MyBottomNavigation extends StatelessWidget {
  final Menus currentIndex;
  final ValueChanged<Menus> onTap;
  const MyBottomNavigation(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: const EdgeInsets.all(24),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 17,
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => onTap(Menus.home),
                      child: SvgPicture.asset(
                        AppIcons.icHome,
                        colorFilter: ColorFilter.mode(
                          currentIndex == Menus.home
                              ? Colors.black
                              : Colors.black.withOpacity(0.3),
                          BlendMode.srcIn,
                        ),
                      ),
                      //),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => onTap(Menus.favorite),
                      child: SvgPicture.asset(
                        AppIcons.icFavorite,
                        colorFilter: ColorFilter.mode(
                          currentIndex == Menus.favorite
                              ? Colors.black
                              : Colors.black.withOpacity(0.3),
                          BlendMode.srcIn,
                        ),
                      ),
                      //),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => onTap(Menus.message),
                      child: SvgPicture.asset(
                        AppIcons.icMessage,
                        colorFilter: ColorFilter.mode(
                          currentIndex == Menus.message
                              ? Colors.black
                              : Colors.black.withOpacity(0.3),
                          BlendMode.srcIn,
                        ),
                      ),
                      //),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => onTap(Menus.user),
                      child: SvgPicture.asset(
                        AppIcons.icUser,
                        colorFilter: ColorFilter.mode(
                          currentIndex == Menus.user
                              ? Colors.black
                              : Colors.black.withOpacity(0.3),
                          BlendMode.srcIn,
                        ),
                      ),
                      //),
                    ),
                  ),
                ],

                // children: [
                //   Expanded(
                //     child: BottomNavigationItem(
                //         onPressed: () => onTap(Menus.home),
                //         icon: AppIcons.icHome,
                //         current: currentIndex,
                //         name: Menus.home),
                //   ),
                //   Expanded(
                //     child: BottomNavigationItem(
                //         onPressed: () => onTap(Menus.favorite),
                //         icon: AppIcons.icFavorite,
                //         current: currentIndex,
                //         name: Menus.favorite),
                //   ),
                //   const Spacer(),
                //   Expanded(
                //     child: BottomNavigationItem(
                //         onPressed: () => onTap(Menus.message),
                //         icon: AppIcons.icMessage,
                //         current: currentIndex,
                //         name: Menus.message),
                //   ),
                //   Expanded(
                //     child: GestureDetector(
                //       onTap: () => onTap(Menus.user),
                //         child: SvgPicture.asset(
                //           AppIcons.icUser,
                //           colorFilter: ColorFilter.mode(
                //             currentIndex == Menus.user
                //                 ? Colors.black
                //                 : Colors.black.withOpacity(0.3),
                //             BlendMode.srcIn,
                //           ),
                //         ),
                //       //),
                //     ),
                //   ),
                // ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(Menus.add),
              child: Container(
                width: 64,
                height: 64,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
                child: SvgPicture.asset(AppIcons.icAdd),
              ),
            ),
          )
        ],
      ),
    );
  }
}
