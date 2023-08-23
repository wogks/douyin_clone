import 'dart:async';
import 'dart:io';

import 'package:douyin_clone/features/authentication/repos/authentication_repo.dart';
import 'package:douyin_clone/features/users/repos/user_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvatarViewModel extends AsyncNotifier<void> {
  late final UserRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.read(userRepo);
  }

  Future<void> uploadAvatar(File file) async {
    state = const AsyncLoading();
    final fileName = ref.read(authRepo).user!.uid;
    state = await AsyncValue.guard(
        () async => await _repository.uploadAvatar(file, fileName));
  }
}
