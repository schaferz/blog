import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ter_ui/widget/container/ter_card.dart';

/// Widget teszt minta.
void main() {
  testWidgets('TerCard-nak van fejrésze', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TerCard(headerText: 'Teszt', child: Text('Teszt tartalom')),
      ),
    );

    expect(find.text('Teszt'), findsOneWidget);
    expect(find.text('Teszt tartalom'), findsOneWidget);
  });
}
