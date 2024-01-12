import 'package:flutter/material.dart';
import 'package:posts_app/data/model/user.dart';
import 'package:posts_app/data/services/get_all_user_service.dart';

class UserProvider extends ChangeNotifier {
  Future<List<User>> getAllUser() async {
    return await GetAllUserService().call();
  }
}
