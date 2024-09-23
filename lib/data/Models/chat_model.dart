class ChatModel {
  final int id;
  final int createdBy;
  final String chatName;

  final String chatType;

  ChatModel({
    required this.id,
    required this.createdBy,
    required this.chatName,
    required this.chatType,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      createdBy: json['created_by'],
      chatName: json['chat_name'],
      chatType: json['chat_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_by': createdBy,
      'chat_name': chatName,
      'chat_type': chatType,
    };
  }
}
