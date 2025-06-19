import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ter_ui/data/data.dart';

/// Űrlap widget mely képes adott típusú [Model]-el dolgozni.
///
/// Például:
/// ```dart
/// final _formKey = GlobalKey<TerFormState<Model>>();
///
/// @override
/// Widget build(BuildContext context) {
///   return TerForm<Model>(
///       key: _formKey,
///       initialData: data,
///       child: TerPanel(
///
///       )
///   );
/// }
/// ```
///
/// Lásd [TerFormState].
class TerForm<T extends Model> extends StatefulWidget {
  /// Kezdeti adatok [Model] alapján.
  final T? initialData;

  /// A gyermek widget.
  final Widget child;

  const TerForm({super.key, this.initialData, required this.child});

  @override
  State<TerForm> createState() => TerFormState<T>();
}

/// Űrlap widget állapot.
class TerFormState<T extends Model> extends State<TerForm> {
  /// Űrlaphoz key.
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(key: _formKey, initialValue: _resolveInitialValue(), child: widget.child);
  }

  /// Mentés és érvényesség ellenőrzés végrehajtása.
  ///
  /// Amennyiben az űrlap érvényes és a mentés sikeres true, egyébként false.
  bool saveAndValidate() => _formKey.currentState?.saveAndValidate() ?? false;

  /// Mentés és érvényesség ellenőrzés végrehajtása modellel. Csak akkor használható, ha a
  /// [TerForm.initialData] meg lett adva. Ez esetben végrehajtja az ellenőrzést
  /// (lásd [saveAndValidate]) és előállítja az új adatokkal a modellt.
  ///
  /// Visszatér az érvényes modellel, mely már tartalmazza az űrlap adatokat vagy null-al ha nincs
  /// elérhető modell.
  T? saveAndValidateModel() {
    assert(widget.initialData != null);

    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final data = _formKey.currentState?.value;

      if (widget.initialData != null && data != null) {
        Map<String, dynamic> mergedData = {...widget.initialData!.toJson(), ...data};

        return widget.initialData!.copyWith(mergedData) as T;
      }
    }

    return null;
  }

  /// Űrlaphoz kezdeti adatok meghatározása [widget.initialData] alapján.
  ///
  /// Lásd [Model.toJson]
  Map<String, dynamic> _resolveInitialValue() {
    if (widget.initialData != null) {
      return widget.initialData!.toJson();
    } else {
      return {};
    }
  }
}
