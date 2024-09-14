class ChatModel {
  final int id;
  final String chatName;

  final String chatType;

  ChatModel({
    required this.id,
    required this.chatName,
    required this.chatType,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      chatName: json['chatname'],
      chatType: json['chattype'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chatname': chatName,
      'chattype': chatType,
    };
  }
}
