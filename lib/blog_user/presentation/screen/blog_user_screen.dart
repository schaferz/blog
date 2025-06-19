import 'package:blog/auth/auth.dart';
import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/blog_user/data/repository/blog_user_repository.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_bloc.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_event.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_state.dart';
import 'package:blog/blog_user/presentation/widget/blog_user_table.dart';
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
      // inject bloc
      child: BlocProvider<BlogUserBloc>(
        create: (context) =>
            BlogUserBloc(repository: context.read<BlogUserRepository>())
              ..add(const BlogUserInitEvent()),
        child: const BlogUserContent(),
      ),
    );
  }
}

/// Blog felhasználók képernyő tartalma.
class BlogUserContent extends StatelessWidget {
  const BlogUserContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogUserBloc, BlogUserState>(
      listener: (context, state) {
        if (state is BlogUserFailure) {
          ErrorDialog.showErrorDialog(context, state.message);
        }
      },
      builder: (context, state) {
        List<BlogUser>? data;

        if (state is BlogUserLoading) {
          return TerLoadingIndicator();
        } else if (state is BlogUserSuccess) {
          data = state.data;
        } else if (state is BlogUserFailure) {
          data = state.data;
        }

        if (data != null) {
          return AuthLayoutWidget(main: BlogUserTable(data: data));
        }

        return Placeholder();
      },
    );
  }
}
