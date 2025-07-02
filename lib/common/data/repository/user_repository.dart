import 'package:get_it_scope_study/common/data/models/user_model.dart';
import 'package:get_it_scope_study/common/util/result.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserRepository {
  Future<Result<UserModel>> getUser() async {
    await Future.delayed(const Duration(seconds: 3));
    return Result.ok(UserModel(id: '1'));
  }
}
