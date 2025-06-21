import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/blog_user/data/repository/blog_user_repository.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_event.dart';
import 'package:flutter/widgets.dart';
import 'package:ter_ui/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    _subscription = _repository.dataStream.listen((data) {
      if (data != null) {
        add(BlogUserDataLoadedEvent(data));
      }
    }, onError: (error) => add(BlogUserFailureEvent(error.toString())));
  }

  factory BlogUserBloc.init(BuildContext context) =>
      BlogUserBloc(repository: context.read<BlogUserRepository>())..add(const BlogUserInitEvent());

  /// Lásd [BlogUserInitEvent].
  Future<void> _onInit(BlogUserInitEvent event, BlogUserEmmiter emit) async {
    _repository.load();
    emit(TerStateLoading());
  }

  /// Lásd [BlogUserDataLoadedEvent].
  Future<void> _onLoaded(BlogUserDataLoadedEvent event, BlogUserEmmiter emit) async {
    emit(TerStateSuccess<BlogUser>(event.data));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
