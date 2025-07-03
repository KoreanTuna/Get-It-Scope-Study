import 'package:flutter/material.dart';
import 'package:get_it_scope_study/common/data/models/user_model.dart';
import 'package:get_it_scope_study/common/data/repository/user_repository.dart';
import 'package:get_it_scope_study/common/util/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';

@Injectable(scope: 'home')
class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._userRepository);

  final UserRepository _userRepository;

  /// 사용자 정보 상태
  final ValueNotifier<AsyncValue<UserModel>> userState = ValueNotifier(
    const AsyncLoading(),
  );

  /// 사용자 정보 Fetching
  Future<void> fetchUser() async {
    final Result<UserModel> result = await _userRepository.getUser();

    result.when(
      ok: (user) {
        userState.value = AsyncData(user);
      },
      error: (error) {
        userState.value = AsyncError(error, StackTrace.current);
      },
    );
  }
}
