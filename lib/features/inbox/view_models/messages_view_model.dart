import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:douyin_clone/features/authentication/repos/authentication_repo.dart';
import 'package:douyin_clone/features/inbox/models/message.dart';
import 'package:douyin_clone/features/inbox/repos/messages_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagesViewModel extends AsyncNotifier<void> {
  late final MessagesRepo _repo;
  @override
  FutureOr<void> build() {
    _repo = ref.read(messagesRepo);
  }

  Future<void> sendMessage(String text) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final message = MessageModel(
        text: text,
        userId: user!.uid,
        ceatedAt: DateTime.now().millisecondsSinceEpoch,
      );
      _repo.sendMessage(message);
    });
  }
}

final messagesProvider = AsyncNotifierProvider<MessagesViewModel, void>(
  () => MessagesViewModel(),
);

final chatProvder = StreamProvider.autoDispose<List<MessageModel>>((ref) {
  final db = FirebaseFirestore.instance;
  return db
      .collection('chat_rooms')
      .doc('xfeHNQkU1Pl3O7tZZjHy')
      .collection('texts')
      .orderBy('ceatedAt')
      .snapshots()
      .map(
        (event) =>
            event.docs.map((doc) => MessageModel.fromJson(doc.data())).toList(),
      );
});
