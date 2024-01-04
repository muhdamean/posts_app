import 'package:flutter/material.dart';
import 'package:flutter_full_course/model/user.dart';

class UserProvider extends InheritedWidget {
  @override
  final Widget child;
  final User user;
  const UserProvider({
    required this.user,
    super.key,
    required this.child,
  }) : super(child: child);

  static User? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>()?.user;
  }

  @override
  bool updateShouldNotify(covariant UserProvider oldWidget) {
    return oldWidget.user.id != user.id;
  }
}
