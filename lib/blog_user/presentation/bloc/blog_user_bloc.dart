import 'dart:async';

import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/blog_user/data/repository/blog_user_repository.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_event.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ter_ui/bloc/bloc.dart';

/// Típus definició [BlogUserState] alapú [Emitter]-hez.
typedef BlogUserEmmiter = Emitter<TerState>;

/// Blog felhasználók kezelését megvalósító [Bloc].
///
/// Lásd [BlogUserEvent].
class BlogUserBloc extends Bloc<BlogUserEvent, TerState> {
  /// A blog felhasználó repository.
  final BlogUserRepository _repository;

  /// Feliratkozás, hogy close-nál lezárhassuk.
  StreamSubscription? _subscription;

  BlogUserBloc({required BlogUserRepository repository})
    : _repository = repository,
      super(TerStateInitial()) {
    on<BlogUserEvent>((_, emit) => emit(TerStateLoading()));
    on<BlogUserInitEvent>(_onInit);
    on<BlogUserDataLoadedEvent>(_onLoaded);
    on<BlogUserInsertEvent>(_onInsert);
    on<BlogUserEditEvent>(_onEdit);
    on<BlogUserCancelEditEvent>(_onCancel);
    on<BlogUserSaveEvent>(_onSave);
    on<BlogUserDeleteEvent>(_onDelete);

    /// Feliratkozás az adatokat biztosító stream-re
    _subscription = _repository.dataStream.listen((data) {
      if (data != null) {
        add(BlogUserDataLoadedEvent(data));
      }
    }, onError: (error) => add(BlogUserFailureEvent(error.toString())));
  }

  /// Factory a kezdő állapot létrehozásához, betöltés elindításához.
  factory BlogUserBloc.init(BuildContext context) =>
      BlogUserBloc(repository: context.read<BlogUserRepository>())..add(const BlogUserInitEvent());

  /// Lásd [BlogUserInitEvent].
  Future<void> _onInit(BlogUserInitEvent event, BlogUserEmmiter emit) async {
    _repository.load();
  }

  /// Lásd [BlogUserDataLoadedEvent].
  Future<void> _onLoaded(BlogUserDataLoadedEvent event, BlogUserEmmiter emit) async {
    emit(TerStateSuccess<BlogUser>(data: event.data));
  }

  /// Lásd [BlogUserInsertEvent].
  Future<void> _onInsert(BlogUserInsertEvent event, BlogUserEmmiter emit) async {
    final newModel = BlogUser(username: '', active: true);

    emit(TerStateEditing(data: _repository.data!, model: newModel));
  }

  /// Lásd [BlogUserEditEvent].
  Future<void> _onEdit(BlogUserEditEvent event, BlogUserEmmiter emit) async {
    emit(TerStateEditing(data: _repository.data!, model: event.data));
  }

  /// Lásd [BlogUserCancelEditEvent].
  Future<void> _onCancel(BlogUserCancelEditEvent event, BlogUserEmmiter emit) async {
    emit(TerStateSuccess(data: _repository.data!));
  }

  /// Lásd [BlogUserSaveEvent].
  Future<void> _onSave(BlogUserSaveEvent event, BlogUserEmmiter emit) async {
    final result = await _repository.saveEdit(event.data);

    result.fold(
      (l) => emit(TerStateFailure(error: l.message)),
      (r) => emit(TerStateSuccess(data: _repository.data!)),
    );
  }

  /// Lásd [BlogUserDeleteEvent].
  Future<void> _onDelete(BlogUserDeleteEvent event, BlogUserEmmiter emit) async {
    final result = await _repository.delete(event.data);

    result.fold(
      (l) => emit(TerStateFailure(error: l.message)),
      (r) => emit(TerStateSuccess(data: _repository.data!)),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
