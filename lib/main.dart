import 'package:flutter/material.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/provider/app_repo.dart';
import 'package:flutter_full_course/provider/post_provider.dart';
import 'package:flutter_full_course/provider/user_provider.dart';
import 'package:flutter_full_course/styles/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppRepo>(
        create: (context) => AppRepo(),
      ),
      ChangeNotifierProvider<PostProvider>(
        create: (context) => PostProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: AppColors.background,
        brightness: Brightness.dark,
      ),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.pages,
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return UserProvider(
  //     userService: UserService(),
  //     child: MaterialApp(
  //       theme: ThemeData(
  //         //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //         //useMaterial3: true,
  //         fontFamily: 'Urbanist',
  //         scaffoldBackgroundColor: AppColors.background,
  //         brightness: Brightness.dark,
  //       ),
  //       initialRoute: AppRoutes.login,
  //       routes: AppRoutes.pages,
  //     ),
  //   );
  // }
}
