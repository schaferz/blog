import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:flutter/foundation.dart';

/// Blog felhasználó közös állapot.
@immutable
class BlogUserState {
  const BlogUserState();
}

/// Blog felhasználó kezdő állapot.
final class BlogUserInitial extends BlogUserState {
  const BlogUserInitial();
}

/// Blog felhasználó betöltés alatt.
final class BlogUserLoading extends BlogUserState {
  const BlogUserLoading();
}

/// Blog felhasználó betöltve, megfelelő, sikeres állapotban van.
final class BlogUserSuccess extends BlogUserState {
  /// A betöltött Blog felhasználó.
  final List<BlogUser> data;

  const BlogUserSuccess({required this.data});
}

/// Sikertelen betöltés utáni állapot.
final class BlogUserFailure extends BlogUserState {
  /// A hiba részletei.
  final String message;

  /// A betöltött blog felhasználók.
  final List<BlogUser>? data;

  const BlogUserFailure({required this.message, this.data});
}
