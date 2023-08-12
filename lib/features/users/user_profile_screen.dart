import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          pinned: true,
          stretch: true,
          backgroundColor: Colors.amber,
          collapsedHeight: 80,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.fadeTitle,
              StretchMode.zoomBackground,
            ],
            background: Image.asset(
              '/Users/wogks/Desktop/flutterPT/douyin_clone/assets/image/ee.jpg',
              fit: BoxFit.cover,
            ),
            title: const Text('Hello!'),
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            childCount: 30,
            (context, index) => Container(
              color: Colors.amber[100 * (index % 9)],
              child: Align(alignment: Alignment.center, child: Text('$index')),
            ),
          ),
          itemExtent: 100,
        ),
      ],
    );
  }
}
