import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_go/features/auth-profile/models/user_models.dart';

part 'transaction_models.g.dart';

//? MARK: Login
@JsonSerializable()
class PostLoginRequestModel {
  final String email;
  final String password;

  PostLoginRequestModel({
    required this.email,
    required this.password,
  });

  factory PostLoginRequestModel.fromJson(Map<String, dynamic> json) => _$PostLoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostLoginRequestModelToJson(this);
}

//? MARK: Register
@JsonSerializable()
class PostRegisterRequestModel {
  final String email;
  final String password;
  final String username;

  PostRegisterRequestModel({
    required this.email,
    required this.password,
    required this.username,
  });

  factory PostRegisterRequestModel.fromJson(Map<String, dynamic> json) => _$PostRegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostRegisterRequestModelToJson(this);
}

//? MARK: User
@JsonSerializable()
class GetUserResponseModel {
  final String id;
  final String email;
  final String username;
  // final String password;
  final SubscriptionType subscription;
  final DateTime createdDate;
  final DateTime updatedDate;

  GetUserResponseModel({
    required this.id,
    required this.email,
    required this.username,
    // required this.password,
    required this.subscription,
    required this.createdDate,
    required this.updatedDate,
  });

  factory GetUserResponseModel.fromJson(Map<String, dynamic> json) => GetUserResponseModel(
        id: json['id'] as String,
        email: json['email'] as String,
        username: json['username'] as String,
        // password: json['password'] as String,
        subscription: SubscriptionType.FREE,
        createdDate: DateTime.now(),
        updatedDate: DateTime.now(),
      );

  User toUser() {
    return User(
      id: id,
      email: email,
      username: username,
      password: "password",
      subscription: subscription,
      createdDate: createdDate,
      updatedDate: updatedDate,
    );
  }
}
