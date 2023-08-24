import 'dart:async';
import 'dart:io';

import 'package:douyin_clone/features/authentication/repos/authentication_repo.dart';
import 'package:douyin_clone/features/videos/repos/video_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideoRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.read(videoRepo);
  }

  Future<void> uploadVideo(File video) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final task = await _repository.uploadVideoFile(video, user!.uid);
      if (task.metadata != null) {}
    });
  }
}
