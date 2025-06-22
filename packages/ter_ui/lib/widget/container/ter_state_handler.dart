import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ter_ui/ter_ui.dart';
import 'package:ter_ui/widget/overlay/error_dialog.dart';

/// Típus definició callback funkcióhoz, mely előállítj a csomagoló layout komponenst.
typedef TerLayoutWidgetBuilder<S> = Widget Function(BuildContext context, S state, Widget content);

/// Típus definició callback funkcióhoz, mely előállítj az elsődleges tartalmat.
typedef TerContentWidgetBuilder<M> = Widget Function(BuildContext context, List<M> data);

/// Típus definició callback funkcióhoz, mely előállítj a szerkesztéshez használt tartalmat.
typedef TerEditWidgetBuilder<M> = Widget Function(BuildContext context, M data);

/// Bloc állapotnak megfelelő build-elést támogató widget.
class TerStateHandler<B extends StateStreamable<TerState>, M extends Model>
    extends StatelessWidget {
  /// Callback builder funkció, mely be csomagolja a handler által
  /// megállapított tartalmat (loading, error, success).
  final TerLayoutWidgetBuilder<TerState> layoutBuilder;

  /// Az elsődleges tartalom amit meg akarunk jelentíteni.
  final TerContentWidgetBuilder<M> contentBuilder;

  /// Szerkesztés esetén megjelenített tartalom.
  final TerEditWidgetBuilder<M> editBuilder;

  const TerStateHandler({
    super.key,
    required this.layoutBuilder,
    required this.contentBuilder,
    required this.editBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, TerState>(
      builder: (context, state) {
        if (state is TerStateLoading) {
          return TerLoadingIndicator();
        }

        Widget content = _resovleContent(context, state);

        return layoutBuilder(context, state, content);
      },
    );
  }

  /// Tartalom meghatározása az aktuális állapot alapján.
  Widget _resovleContent(BuildContext context, TerState state) {
    Widget content;

    if (state is TerStateFailure<Model>) {
      content = ErrorDialog(message: state.error);
    } else if (state is TerStateEditing<M>) {
      content = editBuilder(context, state.model!);
    } else if (state is TerStateSuccess<M>) {
      List<M>? data = _resolveData(state);

      content = contentBuilder(context, data!);
    } else {
      content = TerEmpty();
    }

    return content;
  }

  /// Állapot alapján az aktuális adatlista meghatározása.
  List<M>? _resolveData(TerState state) {
    List<M>? data;

    if (state is TerStateSuccess<M>) {
      data = state.data;
    } else if (state is TerStateFailure<M> && state.data != null) {
      data = state.data!;
    }

    return data;
  }
}
