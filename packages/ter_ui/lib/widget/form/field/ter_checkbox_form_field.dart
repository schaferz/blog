import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ter_ui/widget/form/field/ter_base_form_field.dart';

/// Logikai checkbox űrlap mező.
///
/// Például:
/// ```
/// TerCheckboxFormField(name: 'accessibleMode', label: 'Akadálymentes mód')
/// ```
class TerCheckboxFormField extends TerBaseFormField {
  const TerCheckboxFormField({
    super.key,
    required super.name,
    super.label,
    super.labelText,
    super.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(name: name, title: _resolveTitle(), enabled: enabled);
  }

  /// Cím widget előállítása.
  _resolveTitle() {
    return label ?? Text(labelText ?? '');
  }
}
