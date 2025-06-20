import 'package:blog/blog_user/data/entity/blog_user.dart';
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
      child: TerDataTable(
        columns: [
          TerDataColumn(name: 'id', labelText: 'ID', screen: tabletDesktop),
          TerDataColumn(name: 'username', labelText: 'Felhasználónév'),
          TerDataColumn(name: 'display_name', labelText: 'Név', screen: tabletDesktop),
          TerDataColumn(name: 'active', labelText: 'Aktív', screen: tabletDesktop),
          TerDataColumn(name: 'created_on', labelText: 'Létrehozva', screen: tabletDesktop),
        ],
        data: widget.data,
      ),
    );
  }
}
