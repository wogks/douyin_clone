import 'package:douyin_clone/constants/gaps.dart';
import 'package:douyin_clone/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: const CupertinoSearchTextField(),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(Sizes.size6),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: 10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size4),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder:
                            '/Users/wogks/Desktop/flutterPT/douyin_clone/assets/image/ee.jpg',
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8dkWGo6GZS-vbF55vuOQV4SpwAbjFDKz3ig&usqp=CAU',
                      ),
                    ),
                  ),
                  Gaps.v10,
                  const Text(
                    ' asddj asddjasddj asddjasddjasddjasddjasddjasddjasddjasddj',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gaps.v8,
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(
                            'https://kormedi.com/wp-content/uploads/2022/04/ck_tica1010005154_l-580x387.jpg'),
                      ),
                      Gaps.h4,
                      Expanded(
                        child: Text(
                          '저는 자신이 있습니다. 어떤 기능이든지 전부 만들 수 있습니다.',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Gaps.h4,
                      const FaIcon(
                        FontAwesomeIcons.heart,
                        size: Sizes.size14,
                      ),
                      Gaps.h2,
                      Text(
                        '3M',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(tab),
              ),
          ],
        ),
      ),
    );
  }
}

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];
