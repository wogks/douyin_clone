import 'package:douyin_clone/constants/gaps.dart';
import 'package:douyin_clone/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Direction { right, left }

enum Page { first, second }

class TutoriailScreen extends StatefulWidget {
  const TutoriailScreen({super.key});

  @override
  State<TutoriailScreen> createState() => _TutoriailScreenState();
}

class _TutoriailScreenState extends State<TutoriailScreen> {
  Direction direction = Direction.right;
  Page showningPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        direction = Direction.right;
      });
    } else {
      setState(() {
        direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (direction == Direction.right) {
      setState(() {
        showningPage = Page.first;
      });
    } else {
      setState(() {
        showningPage = Page.second;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    'Watch cool videos!',
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    'Videos are personalized for you based on what you watch, like, and share.',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
              secondChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    'Follow the rules',
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    'Take care of one another! please!.',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
              crossFadeState: showningPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size24,
              horizontal: Sizes.size24,
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: showningPage == Page.first ? 0 : 1,
              child: CupertinoButton(
                color: Theme.of(context).primaryColor,
                child: const Text('Enter the App!'),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
