import 'package:douyin_clone/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class VideoIntro extends StatelessWidget {
  final String descText;
  final FontWeight mainTextbold;
  const VideoIntro(
      {super.key, required this.descText, required this.mainTextbold});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      descText,
      trimLines: 1,
      trimMode: TrimMode.Line,
      colorClickableText: Colors.white,
      trimCollapsedText: 'See More...',
      trimExpandedText: '  Briefly..',
      style: TextStyle(
        color: Colors.white,
        fontSize: Sizes.size16,
        fontWeight: mainTextbold,
      ),
      moreStyle: const TextStyle(
        color: Colors.white,
        fontSize: Sizes.size16,
        fontWeight: FontWeight.bold,
      ),
      lessStyle: const TextStyle(
        color: Colors.white,
        fontSize: Sizes.size16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
