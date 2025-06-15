import 'package:new_attendence/features/login/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String id,
    required String username,
  }) : super(id: id, username: username);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      username: json['username'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
    };
  }
} 