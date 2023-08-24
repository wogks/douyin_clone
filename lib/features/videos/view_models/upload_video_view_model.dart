import 'dart:async';
import 'dart:io';

import 'package:douyin_clone/features/authentication/repos/authentication_repo.dart';
import 'package:douyin_clone/features/users/view_models/users_view_model.dart';
import 'package:douyin_clone/features/videos/models/video_model.dart';
import 'package:douyin_clone/features/videos/repos/video_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideoRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.read(videoRepo);
  }

  Future<void> uploadVideo(File video, BuildContext context) async {
    final user = ref.read(authRepo).user;
    final userProfile = ref.read(usersProvider).value;
    if (user != null) {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(
        () async {
          final task = await _repository.uploadVideoFile(video, user.uid);
          if (task.metadata != null) {
            await _repository.saveVideo(
              VideoModel(
                title: '파이어베이스 업로드 성공',
                description: '나이스',
                fileUrl: await task.ref.getDownloadURL(),
                thumbnailUrl: '',
                creatorUid: user.uid,
                creator: userProfile!.name,
                likes: 0,
                comments: 0,
                createdAt: DateTime.now().millisecondsSinceEpoch,
              ),
            );
            context.pushReplacement('/home');
          }
        },
      );
    }
  }
}

final uploadVideoProvider = AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);
