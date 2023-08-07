import 'package:douyin_clone/constants/gaps.dart';
import 'package:douyin_clone/constants/sizes.dart';
import 'package:flutter/material.dart';

class TutoriailScreen extends StatefulWidget {
  const TutoriailScreen({super.key});

  @override
  State<TutoriailScreen> createState() => _TutoriailScreenState();
}

class _TutoriailScreenState extends State<TutoriailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: const TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
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
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text(
                      'Follow the Rules',
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
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text(
                      'Enjoy your ride!',
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
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size48),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelector(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
