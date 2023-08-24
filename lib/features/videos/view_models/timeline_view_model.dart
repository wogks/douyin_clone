import 'dart:async';

import 'package:douyin_clone/features/videos/models/video_model.dart';
import 'package:douyin_clone/features/videos/repos/video_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  late final VideosRepository _repository;
  List<VideoModel> _list = [];

  @override
  FutureOr<List<VideoModel>> build() async {
    _repository = ref.read(videosRepo);
    final result = await _repository.fetchVideos();
    final newList =
        result.docs.map((doc) => VideoModel.fromJson(doc.data())).toList();
    _list = newList;
    return _list;
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
