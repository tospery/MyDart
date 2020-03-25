import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
    User();

    bool hireable;
    num followers;
    num following;
    @JsonKey(name: 'public_repos')
    num publicRepos;
    @JsonKey(name: 'total_private_repos')
    num totalPrivateRepos;
    @JsonKey(name: 'owned_private_repos')
    num ownedPrivateRepos;
    String login;
    String type;
    String name;
    String company;
    String blog;
    String location;
    String email;
    String bio;
    @JsonKey(name: 'avatar_url')
    String avatarUrl;
    @JsonKey(name: 'created_at')
    String createdAt;
    @JsonKey(name: 'updated_at')
    String updatedAt;
    
    factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
}