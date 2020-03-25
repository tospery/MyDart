import 'package:json_annotation/json_annotation.dart';
import "user.dart";

part 'repo.g.dart';

@JsonSerializable()
class Repo {
  Repo();

  bool private;
  bool fork;

  num id;
  num size;
  @JsonKey(name: 'forks_count')
  num forksCount;
  @JsonKey(name: 'stargazers_count')
  num stargazersCount;
  @JsonKey(name: 'subscribers_count')
  num subscribersCount;
  @JsonKey(name: 'open_issues_count')
  num openIssuesCount;

  String name;
  String language;
  String description;
  @JsonKey(name: 'full_name')
  String fullName;
  @JsonKey(name: 'default_branch')
  String defaultBranch;
  @JsonKey(name: 'pushed_at')
  String pushedAt;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  
  Map<String, dynamic> license;
  User owner;
  Repo parent;

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
