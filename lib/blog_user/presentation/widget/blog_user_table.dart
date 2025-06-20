import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:flutter/material.dart';
import 'package:ter_ui/ter_ui.dart';

/// Tablet és dektop esetén megjelenő oszlopokhoz.
final tabletDesktop = Responsive.tabletDesktop;

/// Blog felhasználókat megjelenítő táblázat. Innen lehet egy adott felhasználó szerkesztését
/// indítani.
class BlogUserTable extends StatelessWidget {
  /// A megjelenítendő adat.
  final List<BlogUser> data;

  /// Beszúrás eseményt kezelő callback.
  final TerColumnActionCallback onInsert;

  /// Szerkesztés eseményt kezelő callback.
  final TerRowActionCallback onEdit;

  /// Törlés eseményt kezelő callback.
  final TerRowActionCallback onDelete;

  const BlogUserTable({
    super.key,
    required this.data,
    required this.onInsert,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return TerPanel(
      headerText: 'Blog felhasználók',
      maxWidth: 1200,
      child: TerDataTable(
        columns: [
          TerFunctionColumn(onInsert: onInsert, onEdit: onEdit, onDelete: onDelete),
          TerColumn(name: 'id', labelText: 'ID', screen: tabletDesktop),
          TerColumn(name: 'username', labelText: 'Felhasználónév'),
          TerColumn(name: 'display_name', labelText: 'Név', screen: tabletDesktop),
          TerColumn(name: 'active', labelText: 'Aktív', screen: tabletDesktop),
          TerColumn(name: 'created_on', labelText: 'Létrehozva', screen: tabletDesktop),
        ],
        data: data,
      ),
    );
  }
}
