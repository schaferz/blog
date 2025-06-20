import 'package:flutter/material.dart';
import 'package:ter_ui/ter_ui.dart';

/// Oszlop táblázatos widget-ekhez. Képes kezelni, hogy csak adott képernyő méret esetén legyen
/// látható.
///
/// Lásd [TerDataTable].
class TerDataColumn {
  /// Az oszlop neve, mely azonosítja milyen értéket kell megjeleníteni egy adott sor esetén.
  final String name;

  /// Oszlop fejrészben megjelenített szöveg.
  final String labelText;

  /// Ha megvan adva, akkor csak bizonyos típusú képernyő esetén jelenik meg az oszlop.
  final List<ScreenType>? screen;

  const TerDataColumn({required this.name, required this.labelText, this.screen});

  /// Visszatér az összeállított oszloppal ha a kapott [screenType] alapján azt meg kell jeleníteni,
  /// egyébként null-al.
  TerNamedDataColumn? buildColumn(BuildContext context, ScreenType screenType) {
    if (screen == null || screen!.contains(screenType)) {
      return TerNamedDataColumn(name: name, label: Text(labelText));
    } else {
      return null;
    }
  }
}

/// A tényleges oszlop amit átadunk majd a [DataTable]-nek és a mely extraként tartalmazza a nevet.
class TerNamedDataColumn extends DataColumn {
  /// Az oszlop neve, mely azonosítja milyen értéket kell megjeleníteni egy adott sor esetén.
  final String name;

  const TerNamedDataColumn({required super.label, required this.name});
}
