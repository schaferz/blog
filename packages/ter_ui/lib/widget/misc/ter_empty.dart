import 'package:flutter/widgets.dart';

/// Üres, placeholder widget, mely elrendezés kialakításában segíthet.
///
/// Például ha spacing miatt csak oda tennék "valamit":
/// Column(
///   spacing: 15,
///   children: [
/// 	  TerDropdownFormField(name: 'theme', items: themeOptions, labelText: 'Téma'),
/// 	  TerEmpty(),
/// 	  Row(
/// 	    children: [TerModelSubmitButton(onSave: onSave, formKey: _formKey)],
/// 	  ),
///   ],
/// )
class TerEmpty extends StatelessWidget {
  const TerEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
