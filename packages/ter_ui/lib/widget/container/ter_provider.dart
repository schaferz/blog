import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ter_ui/bloc/bloc.dart';

/// Repository-t és Bloc-t egyben provider-oló widget.
class TerProvider<Repository, Bloc extends StateStreamableSource<Object?>>
    extends StatelessWidget {
  /// Gyermek widget.
  final Widget child;

  /// Repository-t előállító callback.
  final Repository Function(BuildContext context) repository;

  /// Bloc-ot előállító callback.
  final Bloc Function(BuildContext context) bloc;

  const TerProvider({
    super.key,
    required this.child,
    required this.repository,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => repository(context),
      dispose: (r) {
        if (r is Disposable) {
          r.dispose();
        }
      },
      // inject bloc
      child: BlocProvider(create: (context) => bloc(context), child: child),
    );
  }
}
