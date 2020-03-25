import 'package:json_annotation/json_annotation.dart';
import "user.dart";
import "cacheConfig.dart";

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile();

  num theme;
  String token;
  String locale;
  String lastLogin;
  User user;
  CacheConfig cache;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
