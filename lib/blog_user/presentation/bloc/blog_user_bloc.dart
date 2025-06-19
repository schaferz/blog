import 'package:bloc/bloc.dart';
import 'package:blog/blog_user/data/repository/blog_user_repository.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_event.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_state.dart';

/// Típus definició [BlogUserState] alapú [Emitter]-hez.
typedef BlogUserEmmiter = Emitter<BlogUserState>;

/// Blog felhasználók kezelését megvalósító [Bloc].
///
/// Lásd [BlogUserEvent], [BlogUserState].
class BlogUserBloc extends Bloc<BlogUserEvent, BlogUserState> {
  /// A blog felhasználó repository.
  final BlogUserRepository _repository;

  BlogUserBloc({required BlogUserRepository repository})
    : _repository = repository,
      super(BlogUserInitial()) {
    on<BlogUserEvent>((_, emit) => emit(const BlogUserLoading()));
    on<BlogUserInitEvent>(_initEvent);
  }

  /// Lásd [BlogUserInitEvent].
  Future<void> _initEvent(BlogUserInitEvent event, BlogUserEmmiter emmiter) async {
    final result = await _repository.listUsers();

    result.fold(
      (l) => emmiter(BlogUserFailure(message: l.message)),
      (r) => emmiter(BlogUserSuccess(data: r)),
    );
  }
}
