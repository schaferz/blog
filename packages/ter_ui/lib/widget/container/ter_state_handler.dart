import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ter_ui/ter_ui.dart';
import 'package:ter_ui/widget/overlay/error_dialog.dart';

/// Típus definició callback funkcióhoz, mely előállítj a csomagoló layout komponenst.
typedef TerLayoutWidgetBuilder<S> =
    Widget Function(BuildContext context, S state, Widget content);

/// Típus definició callback funkcióhoz, mely előállítj az elsődleges tartalmat.
typedef TerContentWidgetBuilder<M> =
    Widget Function(BuildContext context, List<M> data);

/// Bloc állapotnak megfelelő build-elést támogató widget.
class TerStateHandler<B extends StateStreamable<TerState>, M extends Model> extends StatelessWidget {
  /// Callback builder funkció, mely be csomagolja a handler által
  /// megállapított tartalmat (loading, error, success).
  final TerLayoutWidgetBuilder<TerState> layout;

  /// Az elsődleges tartalom amit meg akarunk jelentíteni.
  final TerContentWidgetBuilder<M> builder;

  const TerStateHandler({super.key, required this.layout, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, TerState>(
      builder: (context, state) {
        List<M>? data;

        if (state is TerStateLoading) {
          return TerLoadingIndicator();
        } else if (state is TerStateSuccess<M>) {
          data = state.data;
        } else if (state is TerStateFailure<M> && state.data != null) {
          data = state.data!;
        }

        Widget content;

        if (state is TerStateFailure<Model>) {
          content = ErrorDialog(message: state.error);
        } else if (state is TerStateSuccess<Model>) {
          content = builder(context, data!);
        } else {
          content = Placeholder();
        }

        return layout(context, state, content);
      },
    );
  }
}
