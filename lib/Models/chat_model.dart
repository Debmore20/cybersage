class ChatModel {
  final int id;
  final String chatName;

  ChatModel({
    required this.id,
    required this.chatName,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      chatName: json['chatname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chatname': chatName,
    };
  }
}
