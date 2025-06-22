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

/// Blog felhasználó hiba esemény.
class BlogUserFailureEvent extends BlogUserEvent {
  /// Hibaüzenet.
  final String message;

  const BlogUserFailureEvent(this.message);
}

/// Blog felhasználók betöltve.
final class BlogUserDataLoadedEvent extends BlogUserEvent {
  /// A betöltött blog felhasználók.
  final List<BlogUser> data;

  const BlogUserDataLoadedEvent(this.data);
}

/// Blog felhasználó mentés esemény.
class BlogUserInsertEvent extends BlogUserEvent {
  const BlogUserInsertEvent();
}

/// Meglévő blog felhasználó szerkesztés esemény.
class BlogUserEditEvent extends BlogUserEvent {
  /// A mentendő adat..
  final BlogUser data;

  const BlogUserEditEvent({required this.data});
}

/// Szerkesztés elvetése esemény.
class BlogUserCancelEditEvent extends BlogUserEvent {
  const BlogUserCancelEditEvent();
}

/// Meglévő blog felhasználó törlése esemény.
class BlogUserDeleteEvent extends BlogUserEvent {
  /// A mentendő adat.
  final BlogUser data;

  const BlogUserDeleteEvent({required this.data});
}

/// Blog felhasználó mentés esemény.
class BlogUserSaveEvent extends BlogUserEvent {
  /// A mentendő adat.
  final BlogUser data;

  const BlogUserSaveEvent({required this.data});
}
