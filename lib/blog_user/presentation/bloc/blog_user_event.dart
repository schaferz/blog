import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:flutter/foundation.dart';

/// Blog felhasználó események közös őse.
@immutable
sealed class BlogUserEvent {
  const BlogUserEvent();
}

/// Blog felhasználó előkészítése, adatok betöltése.
class BlogUserInitEvent extends BlogUserEvent {
  const BlogUserInitEvent();
}

/// Blog felhasználók betöltve.
final class BlogUserDataLoadedEvent extends BlogUserEvent {
  /// A betöltött blog felhasználók.
  final List<BlogUser> data;

  const BlogUserDataLoadedEvent({required this.data});
}

/// Blog felhasználó mentés esemény.
class BlogUserInsertEvent extends BlogUserEvent {
  /// A mentendő adat..
  final BlogUser data;

  const BlogUserInsertEvent({required this.data});
}

/// Blog felhasználó mentés esemény.
class BlogUserSaveEvent extends BlogUserEvent {
  /// A mentendő adat..
  final BlogUser data;

  const BlogUserSaveEvent({required this.data});
}
