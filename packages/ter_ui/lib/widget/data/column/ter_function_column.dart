import 'package:flutter/material.dart';
import 'package:ter_ui/ter_ui.dart';

/// CRUD műveletek biztosító funkció oszlop. A fejrészbe hozzáadás gomb kerül, a cellákba pedig
/// szerkesztés és törlés.
class TerFunctionColumn extends TerColumn {
  /// Beszúrás eseményt kezelő callback.
  TerColumnActionCallback? onInsert;

  /// Szerkesztés eseményt kezelő callback.
  TerRowActionCallback? onEdit;

  /// Törlés eseményt kezelő callback.
  TerRowActionCallback? onDelete;

  TerFunctionColumn({
    super.name = 'functions',
    super.labelText = '',
    this.onInsert,
    this.onEdit,
    this.onDelete,
  });

  @override
  get columnBuilder => (BuildContext context, TerColumn column) {
    return TerDataColumn(
      label: IconButton(
        onPressed: () {
          if (onInsert != null) {
            onInsert!(context, column);
          }
        },
        icon: Icon(Icons.add),
        color: Colors.green,
        tooltip: 'Új felvitel',
      ),
      source: column,
    );
  };

  @override
  get cellBuilder => (BuildContext context, TerColumn column, JsonData data) {
    return DataCell(
      Row(
        children: [
          IconButton(
            onPressed: () {
              if (onEdit != null) {
                onEdit!(context, column, data);
              }
            },
            icon: Icon(Icons.edit),
            color: Colors.blue,
            tooltip: 'Szerkesztés',
          ),
          IconButton(
            onPressed: () async {
              if (onDelete != null) {
                final result = await showConfirmDialog(context, 'Biztosan törlöd a tételt?');

                if (result && context.mounted) {
                  onDelete!(context, column, data);
                }
              }
            },
            icon: Icon(Icons.delete),
            color: Colors.red,
            tooltip: 'Törlés',
          ),
        ],
      ),
    );
  };
}
