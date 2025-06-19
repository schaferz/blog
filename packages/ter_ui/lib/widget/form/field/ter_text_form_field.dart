import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ter_ui/widget/form/field/ter_base_form_field.dart';

/// Szöveges űrlap beviteli mező.
///
/// Például:
/// ```dart
/// TerTextFormField(
///   name: 'email',
///   decoration: const InputDecoration(labelText: 'E-mail'),
///   validator: TerValidators.compose([
/// 	  TerValidators.required(),
/// 	  TerValidators.email(),
///   ]),
/// )
/// ```
class TerTextFormField extends TerBaseFormField {
  /// Beviteli mező dekorálásához.
  final InputDecoration? decoration;

  /// Érvényesség ellenőrzéshez validator.
  final FormFieldValidator<String>? validator;

  const TerTextFormField({
    super.key,
    required super.name,
    super.label,
    super.labelText,
    super.enabled,
    this.decoration,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      enabled: enabled,
      decoration: _resolveDecoration(),
      validator: validator,
    );
  }

  /// [InputDecoration] előállítássa a mező számára.
  InputDecoration _resolveDecoration() {
    return decoration ?? InputDecoration(labelText: labelText, label: label);
  }
}
