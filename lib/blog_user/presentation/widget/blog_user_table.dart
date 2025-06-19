import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/core/core.dart';
import 'package:flutter/material.dart';
import 'package:ter_ui/ter_ui.dart';

/// Blog felhasználókat megjelenítő táblázat. Innen lehet egy adott felhasználó szerkesztését
/// indítani.
class BlogUserTable extends StatefulWidget {
  final List<BlogUser> data;

  const BlogUserTable({super.key, required this.data});

  @override
  State<BlogUserTable> createState() => _BlogUserTableState();
}

class _BlogUserTableState extends State<BlogUserTable> {
  @override
  Widget build(BuildContext context) {
    return TerPanel(
      headerText: 'Blog felhasználók',
      maxWidth: 1200,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [FittedBox(child: _createDataTable(context))],
      ),
    );
  }

  DataTable _createDataTable(BuildContext context) {
    final desktop = Responsive.isDesktop(context);

    return DataTable(
      columns: desktop ? _createColumns() : _createMobilColumns(),
      rows: desktop ? _createRows() : _createMobilRows(),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
          color: Colors.green,
          tooltip: 'Új felvitel',
        ),
      ),
      DataColumn(label: Text('ID'), tooltip: 'Azonosító'),
      DataColumn(label: Text('Felhasználónév')),
      DataColumn(label: Text('E-mail')),
      DataColumn(label: Text('Név')),
      DataColumn(label: Text('Aktív')),
      DataColumn(label: Text('Létrehozva')),
    ];
  }

  List<DataColumn> _createMobilColumns() {
    return [
      DataColumn(
        label: IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
          color: Colors.green,
          tooltip: 'Új felvitel',
        ),
      ),
      DataColumn(label: Text('Felhasználónév')),
      DataColumn(label: Text('E-mail')),
    ];
  }

  List<DataRow> _createRows() {
    return widget.data
        .map(
          (item) => DataRow(
            cells: [
              DataCell(
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      color: Colors.blue,
                      tooltip: 'Szerkesztés',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      tooltip: 'Törlés',
                    ),
                  ],
                ),
              ),
              DataCell(Text('${item.id}')),
              DataCell(Text(item.username)),
              DataCell(Text('${item.email}')),
              DataCell(Text('${item.displayName}')),
              DataCell(Text('${item.active}')),
              DataCell(Text('${item.createdOn}')),
            ],
          ),
        )
        .toList();
  }

  List<DataRow> _createMobilRows() {
    return widget.data
        .map(
          (item) => DataRow(
            cells: [
              DataCell(
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      color: Colors.blue,
                      tooltip: 'Szerkesztés',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      tooltip: 'Törlés',
                    ),
                  ],
                ),
              ),
              DataCell(Text(item.username)),
              DataCell(Text('${item.email}')),
            ],
          ),
        )
        .toList();
  }
}
