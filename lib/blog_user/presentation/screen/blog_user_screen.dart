import 'package:blog/auth/auth.dart';
import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/blog_user/data/repository/blog_user_repository.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_bloc.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_event.dart';
import 'package:blog/blog_user/presentation/widget/blog_user_edit_form.dart';
import 'package:blog/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ter_ui/ter_ui.dart';

/// Tablet és dektop esetén megjelenő oszlopokhoz.
final tabletDesktop = Responsive.tabletDesktop;

/// Blog felhasználók képernyő.
class BlogUserScreen extends StatelessWidget {
  const BlogUserScreen({super.key});

  /// [BlogUserRepository] és [BlogUserBloc] inject, valamint [BlogUserInitEvent] esemény kiváltása.
  @override
  Widget build(BuildContext context) {
    return TerProvider(
      repository: (context) => BlogUserRepository(client: getIt<SupabaseClient>()),
      bloc: (context) => BlogUserBloc.init(context),
      child: TerStateHandler<BlogUserBloc, BlogUser>(
        layoutBuilder: (context, state, content) => AuthLayoutWidget(main: content),
        contentBuilder: (context, data) => TerCard(
          headerText: 'Blog felhasználók',
          maxWidth: 1200,
          child: TerDataTable(
            columns: [
              TerFunctionColumn(onInsert: handleInsert, onEdit: handleEdit, onDelete: handleDelete),
              TerColumn(name: 'id', labelText: 'ID', screen: tabletDesktop),
              TerColumn(name: 'username', labelText: 'Felhasználónév'),
              TerColumn(name: 'display_name', labelText: 'Név', screen: tabletDesktop),
              TerColumn(name: 'active', labelText: 'Aktív', screen: tabletDesktop),
              TerColumn(name: 'email', labelText: 'E-mail', screen: tabletDesktop),
            ],
            data: data,
          ),
        ),
        editBuilder: (context, data) => BlogUserEditForm(data: data),
      ),
    );
  }

  /// Hozzáadás esemény kezelése.
  handleInsert(BuildContext context, TerColumn column) {
    context.read<BlogUserBloc>().add(BlogUserInsertEvent());
  }

  /// Szerkesztés esemény kezelése.
  handleEdit(BuildContext context, TerColumn column, JsonData data) {
    context.read<BlogUserBloc>().add(BlogUserEditEvent(data: BlogUser.fromJson(data)));
  }

  /// Törlés esemény kezelése.
  handleDelete(BuildContext context, TerColumn column, JsonData data) {
    context.read<BlogUserBloc>().add(BlogUserDeleteEvent(data: BlogUser.fromJson(data)));
  }
}
