import 'dart:async';

import 'package:douyin_clone/features/users/models/user_profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  @override
  FutureOr<UserProfileModel> build() {
    return UserProfileModel.empty();
  }

  Future<void> createAccount(UserCredential credential) async {
    state = AsyncValue.data(UserProfileModel(
      uid: credential.user!.uid,
      email: credential.user!.email ?? 'anon@anon.com',
      name: credential.user!.displayName ?? 'anon',
      bio: 'undifined',
      link: 'undifined',
    ));
  }
}

final usersProvider = AsyncNotifierProvider<UsersViewModel, UserProfileModel>(
  () => UsersViewModel(),
);
