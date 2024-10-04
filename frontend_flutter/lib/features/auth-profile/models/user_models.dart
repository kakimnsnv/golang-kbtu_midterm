import 'dart:convert';

class User {
  final String id;
  final String email;
  final String username;
  final String password;
  final SubscriptionType subscription;
  final DateTime createdDate;
  final DateTime updatedDate;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.subscription,
    required this.createdDate,
    required this.updatedDate,
  });

  factory User.fromString(String jsonString) {
    Map<String, dynamic> json = JsonDecoder().convert(jsonString);
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      password: "password",
      subscription: SubscriptionType.FREE,
      createdDate: DateTime.now(),
      updatedDate: DateTime.now(),
    );
  }

  String toJsonString() {
    return jsonEncode({
      "id": id,
      "email": email,
      "username": username,
      "password": password,
      "subscription": subscription.index,
      "createdDate": createdDate.toIso8601String(),
      "updatedDate": updatedDate.toIso8601String(),
    });
  }

  // String toJsonString() {
  //   return jsonEncode({
  //     "_id": id,
  //     "email": email,
  //     "username": username,
  //     "password": password,
  //     "subscription": subscription,
  //     "createdDate": createdDate,
  //     "updatedDate": updatedDate,
  //   });
  // }
}

/// Enum for SubscriptionType
enum SubscriptionType { FREE, PREMIUM, ENTERPRISE }

User sampleUser = User(
  id: "66e2b39e705d13a7577c4ae9",
  email: "kakim@gmail.come",
  username: "kakimnsnv",
  password: "1234567890",
  subscription: SubscriptionType.FREE,
  createdDate: DateTime.parse("2024-09-12T09:25:50.665Z"),
  updatedDate: DateTime.parse("2024-09-12T09:25:50.665Z"),
);
