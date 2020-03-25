// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile()
    ..theme = json['theme'] as num
    ..token = json['token'] as String
    ..lastLogin = json['lastLogin'] as String
    ..locale = json['locale'] as String
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..cache = json['cache'] == null
        ? null
        : CacheConfig.fromJson(json['cache'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'theme': instance.theme,
      'token': instance.token,
      'lastLogin': instance.lastLogin,
      'locale': instance.locale,
      'user': instance.user,
      'cache': instance.cache,
    };
