import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ter_ui/widget/form/field/ter_base_form_field.dart';

/// Lenyiló vagy értékválasztó űrlap mező.
///
/// Például:
/// ```dart
/// TerDropdownFormField(name: 'theme', items: themeOptions)
/// ```
class TerDropdownFormField<T> extends TerBaseFormField {
  /// Menü elemek.
  final List<DropdownMenuItem<T>> items;

  /// Beviteli mező dekorálásához.
  final InputDecoration? decoration;

  const TerDropdownFormField({
    super.key,
    required super.name,
    super.label,
    super.labelText,
    super.enabled,
    this.decoration,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      name: name,
      items: items,
      decoration: _resolveDecoration(),
      enabled: enabled,
    );
  }

  /// [InputDecoration] előállítássa a mező számára.
  InputDecoration _resolveDecoration() {
    return decoration ?? InputDecoration(labelText: labelText, label: label);
  }
}
