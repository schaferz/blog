import 'package:flutter/material.dart';
import 'package:ter_ui/ter_ui.dart';

/// Típus definició oszlopot összeállító callback-hez.
typedef TerDataColumnBuilder = TerDataColumn Function(BuildContext context, TerColumn column);

/// Típus definició cellát összeállító callback-hez.
typedef TerDataColumnCellBuilder =
    DataCell Function(BuildContext context, TerColumn column, JsonData data);

/// Oszlop táblázatos widget-ekhez. Képes kezelni, hogy csak adott képernyő méret esetén legyen
/// látható.
///
/// Lásd [TerDataTable].
class TerColumn {
  /// Az oszlop neve, mely azonosítja milyen értéket kell megjeleníteni egy adott sor esetén.
  final String name;

  /// Oszlop fejrészben megjelenített szöveg.
  final String labelText;

  /// Ha megvan adva, akkor csak bizonyos típusú képernyő esetén jelenik meg az oszlop.
  final List<ScreenType>? screen;

  /// Egyedi oszlopo összeállítást támogató callback funkció.
  final TerDataColumnBuilder? columnBuilder;

  /// Egyedi cella összeállítást támogató callback funkció.
  final TerDataColumnCellBuilder? cellBuilder;

  const TerColumn({
    required this.name,
    required this.labelText,
    this.screen,
    this.cellBuilder,
    this.columnBuilder,
  });

  /// Visszatér az összeállított oszloppal ha a kapott [screenType] alapján azt meg kell jeleníteni,
  /// egyébként null-al.
  TerDataColumn? buildColumn(BuildContext context, ScreenType screenType) {
    if (screen == null || screen!.contains(screenType)) {
      if (columnBuilder != null) {
        return columnBuilder!(context, this);
      } else {
        return TerDataColumn(source: this, label: Text(labelText));
      }
    } else {
      return null;
    }
  }
}

/// A tényleges oszlop amit átadunk majd a [DataTable]-nek és a mely extraként tartalmazza a nevet.
class TerDataColumn extends DataColumn {
  /// Az oszlop neve, mely azonosítja milyen értéket kell megjeleníteni egy adott sor esetén.
  final TerColumn source;

  const TerDataColumn({required super.label, required this.source});
}
