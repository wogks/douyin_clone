import 'package:douyin_clone/constants/gaps.dart';
import 'package:douyin_clone/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_text.dart';

class VideoBgm extends StatelessWidget {
  final String bgm;
  const VideoBgm({super.key, required this.bgm});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '♫',
          style: TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16,
          ),
        ),
        Gaps.h10,
        Expanded(
          child: MarqueeText(
            text: TextSpan(
              text: bgm,
              style: const TextStyle(
                color: Colors.white,
                fontSize: Sizes.size16,
              ),
            ),
            speed: 40,
            alwaysScroll: true,
          ),
        ),
      ],
    );
  }
}
