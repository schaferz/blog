import 'package:flutter/material.dart';
import 'package:ter_ui/ter_ui.dart';

/// Táblázat adatok kezeléséhez widget. A [DataTable]-t [ListView]-ban tartalmazza, így
/// vertikálisan scroll-ozható. [Model] adatokkal dolgozik, így a sorokat, cellákat és abban
/// szereplő értékeket automatikusan előállítja a [TerDataColumn.name] segítségével.
///
/// Lásd [TerDataColumn].
class TerDataTable extends StatelessWidget {
  /// A táblázat oszlopai.
  final List<TerDataColumn> columns;

  /// A megjelenítendő adatok.
  final List<Model> data;

  const TerDataTable({super.key, required this.columns, required this.data});

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = Responsive.getScreenType(context);
    final List<TerNamedDataColumn> columns = _buildColumns(context, screenType);
    final List<JsonData> dataMap = data.map((e) => e.toJson()).toList();

    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        DataTable(
          columns: _buildColumns(context, screenType),
          rows: _buildRows(context, columns, dataMap),
        ),
      ],
    );
  }

  /// Oszlopok összeállítása a kapott [screenType] képernyő méretnek megfelelően.
  List<TerNamedDataColumn> _buildColumns(BuildContext context, ScreenType screenType) {
    List<TerNamedDataColumn> result = [];

    for (TerDataColumn column in columns) {
      TerNamedDataColumn? dataColumn = column.buildColumn(context, screenType);

      if (dataColumn != null) {
        result.add(dataColumn);
      }
    }

    return result;
  }

  /// Sorok összeállítása a kapott [columns] oszlop lista és a [dataMap]-ban szereplő adatok
  /// alapján.
  List<DataRow> _buildRows(
    BuildContext context,
    List<TerNamedDataColumn> columns,
    List<JsonData> dataMap,
  ) {
    return dataMap.map((element) => _buildRow(context, columns, element)).toList();
  }

  /// Sor összeállítása a kapott [columns] oszlop lista és a [data]-ban szereplő adatok alapján.
  DataRow _buildRow(BuildContext context, List<TerNamedDataColumn> columns, JsonData data) {
    final cells = columns.map((column) {
      return _buildCell(column, data[column.name]);
    }).toList();

    return DataRow(cells: cells);
  }

  /// Cella összeállítása a [column] oszlop és [value] érték alapján.
  DataCell _buildCell(TerNamedDataColumn column, dynamic value) {
    return DataCell(Text('$value'));
  }
}
