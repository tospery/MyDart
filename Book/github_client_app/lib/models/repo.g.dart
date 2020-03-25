// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return Repo()
    ..private = json['private'] as bool
    ..fork = json['fork'] as bool
    ..id = json['id'] as num
    ..size = json['size'] as num
    ..openIssuesCount = json['open_issues_count'] as num
    ..subscribersCount = json['subscribers_count'] as num
    ..forksCount = json['forks_count'] as num
    ..stargazersCount = json['stargazers_count'] as num
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..language = json['language'] as String
    ..fullName = json['full_name'] as String
    ..defaultBranch = json['default_branch'] as String
    ..pushedAt = json['pushed_at'] as String
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String
    ..license = json['license'] as Map<String, dynamic>
    ..owner = json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>)
    ..parent = json['parent'] == null
        ? null
        : Repo.fromJson(json['parent'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'private': instance.private,
      'fork': instance.fork,
      'id': instance.id,
      'size': instance.size,
      'open_issues_count': instance.openIssuesCount,
      'subscribers_count': instance.subscribersCount,
      'forks_count': instance.forksCount,
      'stargazers_count': instance.stargazersCount,
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'full_name': instance.fullName,
      'default_branch': instance.defaultBranch,
      'pushed_at': instance.pushedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'license': instance.license,
      'owner': instance.owner,
      'parent': instance.parent,
    };
