import 'package:flutter/widgets.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

/// Űrlap érvényesség ellenőrzést támgogató osztály.
///
/// Például:
/// ```
/// validator: TerValidators.compose([
/// 	TerValidators.required(),
/// 	TerValidators.email(),
/// ]),
/// ```
class TerValidators {
  /// Több validator egyben történő kezeléséhez.
  static FormFieldValidator<T> compose<T>(List<FormFieldValidator<T>> validators) =>
      FormBuilderValidators.compose(validators);

  /// Kötelezendően kitöltendő mező ellenőrzéséhez.
  static FormFieldValidator<T> required<T>({String? errorText, bool checkNullOrEmpty = true}) =>
      FormBuilderValidators.required(errorText: errorText, checkNullOrEmpty: checkNullOrEmpty);

  /// E-mail ellenőrzéséhez.
  static FormFieldValidator<String> email({
    RegExp? regex,
    String? errorText,
    bool checkNullOrEmpty = true,
  }) => FormBuilderValidators.email(
    regex: regex,
    errorText: errorText,
    checkNullOrEmpty: checkNullOrEmpty,
  );
}
