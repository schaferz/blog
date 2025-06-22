import 'package:blog/auth/auth.dart';
import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ter_ui/ter_ui.dart';

/// Felhasználó új felvitel képernyő.
class BlogUserInsertScreen extends StatelessWidget {

  /// Űrlaphoz key.
  final _formKey = GlobalKey<TerFormState<BlogUser>>();

  BlogUserInsertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BlogUserBloc>();
    final state = bloc.state as TerStateSuccess<BlogUser>;
    final user = BlogUser(username: '');
    // Navigator.of(context).pop()

    return AuthLayoutWidget(
      main: TerForm<BlogUser>(
      key: _formKey,
      initialData: user,
      child: TerCard(
        headerText: 'Beállítások',
        maxWidth: 750,
        child: Column(
          spacing: 15,
          children: [
            TerTextFormField(name: 'username', labelText: 'Felhasználónév'),
            TerTextFormField(name: 'email', enabled: false, labelText: 'E-mail'),
            TerEmpty(),
            Row(
              children: [TerModelSubmitButton(onSave: (data) {

              }, formKey: _formKey)],
            ),
          ],
        ),
      ),
    ),
    );
  }
}
