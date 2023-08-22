import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:douyin_clone/features/users/models/user_profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createProfile(UserProfileModel user) async {}
}

final userRepo = Provider((ref) {
  return UserRepository();
});
