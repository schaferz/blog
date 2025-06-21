import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/blog_user/data/repository/blog_user_repository.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_event.dart';
import 'package:ter_ui/bloc/bloc.dart';

/// Típus definició [BlogUserState] alapú [Emitter]-hez.
typedef BlogUserEmmiter = Emitter<TerBlocState>;

/// Blog felhasználók kezelését megvalósító [Bloc].
///
/// Lásd [BlogUserEvent].
class BlogUserBloc extends Bloc<BlogUserEvent, TerBlocState> {
  /// A blog felhasználó repository.
  final BlogUserRepository _repository;

  /// Feliratkozás, hogy close-nál lezárhassuk.
  StreamSubscription? _subscription;

  BlogUserBloc({required BlogUserRepository repository})
    : _repository = repository,
      super(TerBlocInitial()) {
    on<BlogUserEvent>((_, emit) => emit(TerBlocLoading()));
    on<BlogUserInitEvent>(_onInit);
    on<BlogUserDataLoadedEvent>(_onLoaded);

    _subscription = _repository.dataStream.listen(
      (data) {
        if (data != null) {
          add(BlogUserDataLoadedEvent(data));
        }
      },
      onError: (error) => add(BlogUserFailureEvent(error.toString())),
    );
  }

  /// Lásd [BlogUserInitEvent].
  Future<void> _onInit(BlogUserInitEvent event, BlogUserEmmiter emit) async {
    _repository.load();
    emit(TerBlocLoading());
  }

  /// Lásd [BlogUserDataLoadedEvent].
  Future<void> _onLoaded(BlogUserDataLoadedEvent event, BlogUserEmmiter emit) async {
    emit(TerBlocSuccess<BlogUser>(event.data));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
