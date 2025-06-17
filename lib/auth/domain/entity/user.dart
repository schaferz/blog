import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

/// Supabase felhasználó.
@immutable
class User extends Equatable {
  /// Egyedi azonosító.
  final String id;

  /// Felhasználó e-mail címe.
  final String email;

  const User({required this.id, required this.email});

  @override
  String toString() => 'User{id:$id,email:$email}';

  @override
  List<Object> get props => [id, email];

  /// [User] létrehozása a kapott [json] alapján.
  factory User.fromJson(Map<String, dynamic> json) => User(id: json['id'], email: json['email']);
}
