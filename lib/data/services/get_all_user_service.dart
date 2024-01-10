import 'package:flutter_full_course/data/model/user.dart';
import 'package:flutter_full_course/data/services/base_service.dart';

class GetAllUserService extends ServiceBase<List<User>> {
  @override
  Future<List<User>> call() async {
    final result = await get('user');
    return List.generate(
        result['data'].length, (index) => User.fromJson(result['data'][index]));
  }
}
