import 'package:posts_app/pages/edit_profile.dart';
import 'package:posts_app/pages/home_page.dart';
import 'package:posts_app/pages/login_page.dart';
import 'package:posts_app/pages/main_page.dart';
import 'package:posts_app/pages/nearby_page.dart';
import 'package:posts_app/pages/user_page.dart';
import 'package:posts_app/provider/login_provider.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static final pages = {
    login: (context) => ChangeNotifierProvider(
          create: (context) => LoginProvider(),
          child: const LoginPage(),
        ),
    home: (context) => const HomePage(),
    main: (context) => const MainPage(),
    editProfile: (context) => const EditProfilePage(),
    nearby: (context) => const NearbyPage(),
    user: (context) => const UserPage(),
  };

  static const login = '/';
  static const home = '/home';
  static const main = '/main';
  static const editProfile = '/edit_profile';
  static const nearby = '/nearby';
  static const user = '/user';
}
