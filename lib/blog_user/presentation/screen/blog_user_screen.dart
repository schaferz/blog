import 'package:blog/auth/auth.dart';
import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/blog_user/data/repository/blog_user_repository.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_bloc.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_event.dart';
import 'package:blog/blog_user/presentation/screen/blog_user_insert_screen.dart';
import 'package:blog/blog_user/presentation/widget/blog_user_table.dart';
import 'package:blog/core/config/route/no_transition_page_route.dart';
import 'package:blog/core/core.dart';
import 'package:blog/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ter_ui/ter_ui.dart';

/// Blog felhasználók képernyő.
class BlogUserScreen extends StatelessWidget {
  const BlogUserScreen({super.key});

  /// [BlogUserRepository] és [BlogUserBloc] inject, valamint [BlogUserInitEvent] esemény kiváltása.
  @override
  Widget build(BuildContext context) {
    // inject repository
    return RepositoryProvider(
      create: (_) => BlogUserRepository(client: getIt<SupabaseClient>()),
      dispose: (r) => r.dispose(),
      // inject bloc
      child: BlocProvider(
        create: (context) =>
            BlogUserBloc(repository: context.read<BlogUserRepository>())
              ..add(const BlogUserInitEvent()),
        child: BlocBuilder<BlogUserBloc, TerBlocState>(
          builder: (context, state) {
            List<BlogUser>? data;

            if (state is TerBlocLoading) {
              return TerLoadingIndicator();
            } else if (state is TerBlocSuccess<BlogUser>) {
              data = state.data;
            } else if (state is TerBlocFailure<BlogUser> && state.data != null) {
              data = state.data!;
            }

            Widget content;

            if (state is TerBlocFailure<BlogUser>) {
              content = ErrorDialog(message: state.error);
            } else if (state is TerBlocSuccess<BlogUser>) {
              content = BlogUserTable(
                data: data!,
                onInsert: handleInsert,
                onEdit: handleEdit,
                onDelete: handleDelete,
              );
            } else {
              content = Placeholder();
            }

            return AuthLayoutWidget(main: content);
          },
        ),
      ),
    );
  }

  /// Hozzáadás esemény kezelése.
  handleInsert(BuildContext context, TerColumn column) {
    final bloc = context.read<BlogUserBloc>();

    Navigator.push(
      context,
      NoTransitionPageRoute(
        builder: (context) => BlocProvider.value(value: bloc, child: const BlogUserInsertScreen()),
      ),
    );
  }

  /// Szerkesztés esemény kezelése.
  handleEdit(BuildContext context, TerColumn column, JsonData data) {}

  /// Törlés esemény kezelése.
  handleDelete(BuildContext context, TerColumn column, JsonData data) {}
}
