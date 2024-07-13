import 'dart:io';

import 'package:flutter/widgets.dart';

class UserModel {
  final String uId;
  final String username;

  final String email;


  UserModel( {
    required this.uId,

    required this.username,
    required this.email,

  });

  // Serialize the UserModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'username': username,
      'email': email,

    };
  }

  // Create a UserModel instance from a JSON map
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      username: json['username'],
      email: json['email'],

    );
  }
}
