import 'package:blog/core/config/config.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      themeMode: ThemeMode.dark,
      directories: directories,
      addons: [
        InspectorAddon(),
        MaterialThemeAddon(
          themes: [WidgetbookTheme(name: 'dark', data: AppTheme.createThemeData(context))],
        ),
      ],
    );
  }
}
