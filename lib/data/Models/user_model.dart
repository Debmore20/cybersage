class User {
  final int id;
  final String firstName;
  final String lastName;
  final String userName;
  final String phone;
  final String email;
  final DateTime createdAt;

  User(
      {required this.firstName,
      required this.lastName,
      required this.userName,
      required this.phone,
      required this.createdAt,
      required this.id,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      phone: json['phone'],
      email: json['email'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'phone': phone,
      'email': email,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
