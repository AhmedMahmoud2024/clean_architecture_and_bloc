import 'package:clean_architecture_and_bloc/core/common/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.email, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'] ?? '',
        email: map['email'] ?? '',
        name: map['name'] ?? '');
  }
  UserModel copyWith( // toJson
      {
    String? id,
    String? email,
    String? name,
  }) {
    return UserModel(
        id: id ?? this.id, email: email ?? this.email, name: name ?? this.name);
  }
}
