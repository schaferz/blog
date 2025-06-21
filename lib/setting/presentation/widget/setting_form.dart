import 'package:blog/setting/data/entity/setting.dart';
import 'package:flutter/material.dart';
import 'package:ter_ui/ter_ui.dart';

/// Téma opciók.
final List<DropdownMenuItem<String>> themeOptions = [
  DropdownMenuItem(value: 'ligth', child: Text('Light')),
  DropdownMenuItem(value: 'dark', child: Text('Dark')),
];

/// Beállítások űrlap, mely lehetővé teszi [Setting] értékek karbantartását.
class SettingForm extends StatelessWidget {
  /// A karbantartott adat.
  final Setting data;

  /// Mentés eseményre hívandó akció.
  final Function(Setting) onSave;

  /// Űrlaphoz key.
  final _formKey = GlobalKey<TerFormState<Setting>>();

  SettingForm({super.key, required this.data, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return TerForm<Setting>(
      key: _formKey,
      initialData: data,
      child: TerPanel(
        headerText: 'Beállítások',
        maxWidth: 750,
        child: Column(
          spacing: 15,
          children: [
            TerTextFormField(name: 'email', enabled: false, labelText: 'E-mail'),
            TerTextFormField(name: 'display_name', labelText: 'Megjelenített név'),
            TerDropdownFormField(name: 'theme', items: themeOptions, labelText: 'Téma'),
            TerCheckboxFormField(name: 'accessible_mode', labelText: 'Akadálymentes mód'),
            TerEmpty(),
            Row(
              children: [TerModelSubmitButton(onSave: onSave, formKey: _formKey)],
            ),
          ],
        ),
      ),
    );
  }
}
