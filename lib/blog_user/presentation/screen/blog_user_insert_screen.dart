import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/blog_user/presentation/bloc/blog_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ter_ui/bloc/bloc.dart';

class BlogUserInsertScreen extends StatelessWidget {
  const BlogUserInsertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BlogUserBloc>();
    final state = bloc.state as TerStateSuccess<BlogUser>;

    return Column(
      children: [
        Text('Felvitel'),
        Text(state.data[0].username),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Vissza'),
        ),
      ],
    );
  }
}
