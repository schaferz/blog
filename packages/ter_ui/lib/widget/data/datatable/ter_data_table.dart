import 'package:flutter/material.dart';
import 'package:ter_ui/ter_ui.dart';

/// Táblázat adatok kezeléséhez widget. A [DataTable]-t [ListView]-ban tartalmazza, így
/// vertikálisan scroll-ozható. [Model] adatokkal dolgozik, így a sorokat, cellákat és abban
/// szereplő értékeket automatikusan előállítja a [TerColumn.name] segítségével.
///
/// Lásd [TerColumn].
class TerDataTable extends StatelessWidget {
  /// A táblázat oszlopai.
  final List<TerColumn> columns;

  /// A megjelenítendő adatok.
  final List<Model> data;

  const TerDataTable({super.key, required this.columns, required this.data});

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = Responsive.getScreenType(context);
    final List<TerDataColumn> columns = _buildColumns(context, screenType);
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
  List<TerDataColumn> _buildColumns(BuildContext context, ScreenType screenType) {
    List<TerDataColumn> result = [];

    for (TerColumn column in columns) {
      TerDataColumn? dataColumn = column.buildColumn(context, screenType);

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
    List<TerDataColumn> columns,
    List<JsonData> dataMap,
  ) {
    return dataMap.map((element) => _buildRow(context, columns, element)).toList();
  }

  /// Sor összeállítása a kapott [columns] oszlop lista és a [data]-ban szereplő adatok alapján.
  DataRow _buildRow(BuildContext context, List<TerDataColumn> columns, JsonData data) {
    final cells = columns.map((col) {
      return _buildCell(context, col, data);
    }).toList();

    return DataRow(cells: cells);
  }

  /// Cella összeállítása a [column] oszlop és [data] alapján.
  DataCell _buildCell(BuildContext context, TerDataColumn column, JsonData data) {
    if (column.source.cellBuilder != null) {
      return column.source.cellBuilder!(context, column.source, data);
    }

    return DataCell(Text('${data[column.source.name]}'));
  }
}
