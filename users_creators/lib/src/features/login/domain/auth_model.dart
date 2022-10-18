// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@CopyWith()
@JsonSerializable()
class AuthModel {
  String? refreshToken;
  String? language;
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? userName;
  String id;
  String? role;
  String? issued;
  String? expires;

  AuthModel(
      {this.refreshToken,
      this.language,
      required this.id,
      this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.userName,
      this.role,
      this.issued,
      this.expires});

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
