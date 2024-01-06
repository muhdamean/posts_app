import 'package:flutter/material.dart';
import 'package:flutter_full_course/model/user.dart';

class UserProvider extends InheritedWidget {
  @override
  final Widget child;
  final UserService userService;
  const UserProvider({
    required this.userService,
    super.key,
    required this.child,
  }) : super(child: child);

  static UserService? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<UserProvider>()
        ?.userService;
  }

  @override
  bool updateShouldNotify(covariant UserProvider oldWidget) {
    return oldWidget.userService.user?.id != userService.user?.id;
  }
}

class UserService {
  User? _user;
  User? get user => _user;
  updateUser(User user) {
    _user = user;
  }
}
