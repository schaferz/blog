import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ter_ui/ter_ui.dart';

/// Blog felhasználó, mely nem (ezen) admin felületre vonatkozik, hanem a blog olvasóira.
@immutable
class BlogUser extends Equatable implements Model {
  /// Egyedi azonosító.
  final int? id;

  /// Felhasználó neve.
  final String username;

  /// Felhasználót azonosító e-mail cím.
  final String? email;

  /// Opcionális megjelenített név (ha nincs megadva az e-mail cím).
  final String? displayName;

  /// Aktív-e a felhasználó?
  final bool? active;

  /// Felhasználót bemutató szöveg.
  final String? bio;

  /// Felhasználó létrehozásának a dátuma.
  final String? createdOn;

  const BlogUser({
    this.id,
    required this.username,
    this.email,
    this.displayName,
    this.active,
    this.bio,
    this.createdOn,
  });

  @override
  List<Object?> get props => [id, username, email, displayName, active, bio, createdOn];

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'display_name': displayName,
    'active': active,
    'bio': bio,
    'created_on': createdOn,
  }.filter((v) => v != null);

  @override
  BlogUser copyWith(Map<String, dynamic> data) {
    return BlogUser(
      id: data['id'] ?? id,
      username: data['username'] ?? username,
      email: data['email'] ?? email,
      displayName: data['display_name'] ?? displayName,
      active: data['active'] ?? active,
      bio: data['bio'] ?? bio,
      createdOn: data['created_on'] ?? createdOn,
    );
  }

  /// [BlogUser] létrehozása a kapott [json] alapján.
  factory BlogUser.fromJson(Map<String, dynamic> json) => BlogUser(username: '').copyWith(json);
}
