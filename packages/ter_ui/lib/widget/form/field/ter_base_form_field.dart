import 'package:flutter/cupertino.dart';

/// Közös ős az űrlap mezők számára.
abstract class TerBaseFormField extends StatelessWidget {
  /// Form adatok között a mező azonosításához.
  final String name;

  /// Checkbox cím widget, tipukusan szöveg. Használható helyette a [labelText].
  final Widget? label;

  /// Címke szöveg.
  final String? labelText;

  /// Engedélyezve van-e a mező?
  final bool enabled;

  const TerBaseFormField({
    super.key,
    required this.name,
    this.labelText,
    this.label,
    this.enabled = true,
  });
}
