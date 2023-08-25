class MessageModel {
  final String text;
  final String userId;
  final int ceatedAt;

  MessageModel(
      {required this.text, required this.userId, required this.ceatedAt});

  MessageModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        ceatedAt = json['ceatedAt'],
        userId = json['userId'];

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'userId': userId,
      'ceatedAt': ceatedAt,
    };
  }
}
