import 'package:flutter/material.dart';
import 'package:flutter_full_course/model/user.dart';

class AppRepo extends ChangeNotifier {
  String? _token;
  User? user;

  set token(String? value) => _token = value;

  String? get token => _token;
}
