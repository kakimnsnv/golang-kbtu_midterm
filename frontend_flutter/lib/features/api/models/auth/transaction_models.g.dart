// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLoginRequestModel _$PostLoginRequestModelFromJson(
        Map<String, dynamic> json) =>
    PostLoginRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$PostLoginRequestModelToJson(
        PostLoginRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

PostRegisterRequestModel _$PostRegisterRequestModelFromJson(
        Map<String, dynamic> json) =>
    PostRegisterRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$PostRegisterRequestModelToJson(
        PostRegisterRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
    };

GetUserResponseModel _$GetUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUserResponseModel(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      subscription:
          $enumDecode(_$SubscriptionTypeEnumMap, json['subscription']),
      createdDate: DateTime.parse(json['createdDate'] as String),
      updatedDate: DateTime.parse(json['updatedDate'] as String),
    );

Map<String, dynamic> _$GetUserResponseModelToJson(
        GetUserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'subscription': _$SubscriptionTypeEnumMap[instance.subscription]!,
      'createdDate': instance.createdDate.toIso8601String(),
      'updatedDate': instance.updatedDate.toIso8601String(),
    };

const _$SubscriptionTypeEnumMap = {
  SubscriptionType.FREE: 'FREE',
  SubscriptionType.PREMIUM: 'PREMIUM',
  SubscriptionType.ENTERPRISE: 'ENTERPRISE',
};
