import 'package:douyin_clone/features/videos/widgets/video_post.dart';
import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  final _scrollDuration = const Duration(milliseconds: 200);
  final _scrollCurve = Curves.linear;

  final PageController _pageController = PageController();

  void _onPageChange(int page) {
    _pageController.animateToPage(
      page,
      curve: _scrollCurve,
      duration: _scrollDuration,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;

      setState(() {});
    }
  }

  void _onVideoFinished() {
    _pageController.nextPage(
      curve: _scrollCurve,
      duration: _scrollDuration,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      onPageChanged: _onPageChange,
      itemBuilder: (context, index) {
        return VideoPost(onVideoFinished: _onVideoFinished, index: index);
      },
    );
  }
}
