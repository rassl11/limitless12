// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_password.g.dart';

@CopyWith()
@JsonSerializable()
class EditPassword {
  String? password;
  String? newPassword;
  String? confirmPassword;

  EditPassword({required this.password, required this.newPassword,required this.confirmPassword});

  factory EditPassword.fromJson(Map<String, dynamic> json) =>
      _$EditPasswordFromJson(json);

  Map<String, dynamic> toJson() => _$EditPasswordToJson(this);
}
