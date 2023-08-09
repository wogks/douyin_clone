import 'package:douyin_clone/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostVideoButton extends StatelessWidget {
  final bool inverted;
  const PostVideoButton({super.key, required this.inverted});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 20,
          child: Container(
            height: 30,
            width: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff61D4F0),
              borderRadius: BorderRadius.circular(
                Sizes.size8,
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            height: 30,
            width: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(
                Sizes.size8,
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.size8),
            color: !inverted ? Colors.white : Colors.black,
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: Sizes.size16,
              color: !inverted ? Colors.black : Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
