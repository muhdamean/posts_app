import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_full_course/data/response/login_response.dart';
import 'package:flutter_full_course/data/services/login_service.dart';

import '../model/user.dart';

class LoginProvider extends ChangeNotifier {
  var username = '';
  var password = '';

  Future<LoginResponse> login() async {
    return LoginService(username, password).call();

    // final body = {'username': username, 'password': password};
    // final response = await http.post(
    //   Uri.parse(loginRoute),
    //   body: jsonEncode(body),
    // );
    // if (response.statusCode == 200) {
    //   debugPrint(response.body);
    //   final json = jsonDecode(response.body);
    //   final user = User.fromJson(json['data']);
    //   return user;
    // } else {
    //   debugPrint(response.body);
    //   debugPrint('You have an error!');
    //   throw Exception('Error');
    // }
  }
}
