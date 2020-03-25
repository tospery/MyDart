// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..hireable = json['hireable'] as bool
    ..followers = json['followers'] as num
    ..following = json['following'] as num
    ..publicRepos = json['public_repos'] as num
    ..totalPrivateRepos = json['total_private_repos'] as num
    ..ownedPrivateRepos = json['owned_private_repos'] as num
    ..login = json['login'] as String
    ..type = json['type'] as String
    ..name = json['name'] as String
    ..company = json['company'] as String
    ..blog = json['blog'] as String
    ..location = json['location'] as String
    ..email = json['email'] as String
    ..bio = json['bio'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'hireable': instance.hireable,
      'followers': instance.followers,
      'following': instance.following,
      'public_repos': instance.publicRepos,
      'total_private_repos': instance.totalPrivateRepos,
      'owned_private_repos': instance.ownedPrivateRepos,
      'login': instance.login,
      'type': instance.type,
      'name': instance.name,
      'company': instance.company,
      'blog': instance.blog,
      'location': instance.location,
      'email': instance.email,
      'bio': instance.bio,
      'avatar_url': instance.avatarUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
