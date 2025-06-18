import 'dart:developer' show log;

import 'package:blog/setting/data/entity/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
  final Function(Setting)? onSave;

  /// Űrlaphoz key.
  final _formKey = GlobalKey<FormBuilderState>();

  SettingForm({super.key, required this.data, this.onSave});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        constraints: BoxConstraints(maxWidth: 450),
        child: Padding(
          padding: EdgeInsetsGeometry.all(20.0),
          child: FormBuilder(
            key: _formKey,
            initialValue: data.toJson(),
            child: Column(
              children: [
                // Beállítások
                Row(children: [Text('Beállítások', style: TextStyle(fontSize: 18.0))]),
                SizedBox(height: 24),
                FormBuilderTextField(
                  name: 'email',
                  enabled: false,
                  decoration: const InputDecoration(labelText: 'E-mail', hintText: 'E-mail'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                const SizedBox(height: 15),
                // Megjelenített név
                FormBuilderTextField(
                  name: 'display_name',
                  decoration: const InputDecoration(labelText: 'Megjelenített név'),
                ),
                const SizedBox(height: 15),
                // Téma
                FormBuilderDropdown(
                  name: 'theme',
                  items: themeOptions,
                  decoration: const InputDecoration(labelText: 'Téma'),
                ),
                const SizedBox(height: 15),
                FormBuilderCheckbox(name: 'accessible_mode', title: Text('Akadálymentes mód')),
                const SizedBox(height: 25),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          final settingData = _formKey.currentState?.value;

                          log('Validation success: $settingData');

                          if (onSave != null && settingData != null) {
                            Map<String, dynamic> mergedData = {...data.toJson(), ...settingData};

                            onSave!(Setting.fromJson(mergedData));
                          }
                        } else {
                          log('Validation failed: ${_formKey.currentState?.value.toString()}');
                        }
                      },
                      child: Text('Mentés'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
