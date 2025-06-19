import 'package:flutter/material.dart';
import 'package:ter_ui/ter_ui.dart';

/// Gomb widget mely végrehajtja az érvényesség ellenőrzést és mentést, majd a már összeállított
/// modellt biztosítja az [onSave] függvény számára.
class TerModelSubmitButton<T extends Model> extends StatelessWidget {
  /// Űrlap állapothoz történé hozzáféréshez kulcs.
  final GlobalKey<TerFormState<T>> formKey;

  /// Mentés eseményre hívandó akció.
  final Function(T) onSave;

  const TerModelSubmitButton({super.key, required this.onSave, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final modelValue = formKey.currentState?.saveAndValidateModel();

        if (modelValue != null) {
          onSave(modelValue);
        }
      },
      child: Text('Mentés'),
    );
  }
}
