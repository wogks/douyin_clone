import 'package:douyin_clone/constants/sizes.dart';
import 'package:douyin_clone/features/inbox/chat_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  final List<int> _items = [];

  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(_items.length);
      _items.add(_items.length);
    }
  }

  void _deleteItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: _makeListTile(
            index,
          ),
        ),
      );
      _items.removeAt(index);
    }
  }

  void _onChatTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ChatDetailScreen(),
      ),
    );
  }

  Widget _makeListTile(int index) {
    return ListTile(
      onTap: _onChatTap,
      onLongPress: () => _deleteItem(index),
      leading: const CircleAvatar(
        foregroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN02Q-MzBFJMHx8Gq903bLOMVOIDDXojcYgQ&usqp=CAU'),
        radius: 30,
        child: Text('아들'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '어머이 ($index)',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '2:13 Am',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: Sizes.size12,
            ),
          ),
        ],
      ),
      subtitle: const Text("빨리 취업하거라 아들"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Direct messages'),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(FontAwesomeIcons.plus),
          )
        ],
      ),
      body: AnimatedList(
        key: _key,
        padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            key: UniqueKey(),
            opacity: animation,
            child: SizeTransition(
                sizeFactor: animation,
                child: _makeListTile(
                  index,
                )),
          );
        },
      ),
    );
  }
}
