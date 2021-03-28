// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$_$_UserModelFromJson(Map<String, dynamic> json) {
  return _$_UserModel(
    email: json['email'] as String,
    username: json['username'] as String,
    token: json['token'] as String,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$_$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'token': instance.token,
      'image': instance.image,
    };
