import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_bloc.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ter_ui/ter_ui.dart';

/// Felhasználó új felvitel képernyő.
class BlogUserEditForm extends StatelessWidget {
  /// A szerkesztett felhasználó.
  final BlogUser data;

  /// Űrlaphoz key.
  final _formKey = GlobalKey<TerFormState<BlogUser>>();

  BlogUserEditForm({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return TerForm<BlogUser>(
      key: _formKey,
      initialData: data,
      child: TerCard(
        headerText: 'Beállítások',
        maxWidth: 750,
        child: Column(
          spacing: 15,
          children: [
            TerTextFormField(
              name: 'username',
              labelText: 'Felhasználónév',
              validator: TerValidators.required(),
            ),
            TerTextFormField(name: 'email', labelText: 'E-mail'),
            TerTextFormField(name: 'display_name', labelText: 'Név'),
            TerCheckboxFormField(name: 'active', labelText: 'Aktív'),
            TerTextFormField(name: 'bio', labelText: 'Bemutatkozás', maxLines: 2),
            TerEmpty(),
            Row(
              spacing: 10.0,
              children: [
                TerModelSubmitButton(
                  onSave: (data) {
                    context.read<BlogUserBloc>().add(BlogUserSaveEvent(data: data));
                  },
                  formKey: _formKey,
                ),
                TextButton(
                  onPressed: () => context.read<BlogUserBloc>().add(BlogUserCancelEditEvent()),
                  child: Text('Mégse'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
