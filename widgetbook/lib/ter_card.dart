import 'package:flutter/material.dart';
import 'package:ter_ui/ter_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: TerCard)
Widget buildTerCardUseCase(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TerCard(
            headerText: context.knobs.string(label: 'Fejrész szövege', initialValue: 'Fejrész'),
            maxWidth: 1200,
            child: Column(
              children: [
                Text(
                  context.knobs.string(label: 'Kártya tartalma', initialValue: 'A kártya tartalma'),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
