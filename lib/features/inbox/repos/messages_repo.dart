import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:douyin_clone/features/inbox/models/message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagesRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMessage(MessageModel message) async {
    _db
        .collection('chat_rooms')
        .doc('xfeHNQkU1Pl3O7tZZjHy')
        .collection('texts')
        .add(message.toJson());
  }
}

final messagesRepo = Provider((ref) {
  return MessagesRepo();
});
