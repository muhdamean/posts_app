import 'package:flutter/material.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/model/user.dart';
import 'package:flutter_full_course/provider/user_provider.dart';
import 'package:flutter_full_course/styles/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      user: User(1, 'firstname', 'lastname', 'mobile', 'birthday', 'gender', false),
      child: MaterialApp(
        theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //useMaterial3: true,
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: AppColors.background,
          brightness: Brightness.dark,
        ),
        initialRoute: AppRoutes.login,
        routes: AppRoutes.pages,
      ),
    );
  }
}
