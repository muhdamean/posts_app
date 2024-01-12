import 'package:flutter/material.dart';
import 'package:posts_app/data/response/login_response.dart';
import 'package:posts_app/data/services/login_service.dart';

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
