import 'package:blog/core/core.dart';
import 'package:flutter/material.dart';

/// Kártya widget az utolsó post-ok megjelenítéséhez.
class MainRecentCardWidget extends StatelessWidget {
  /// Gyermek widget.
  final Widget child;

  /// Opcionális szín (alapértelmezett [AppTheme.cardBackgroundColor]).
  final Color? color;

  /// Opcionális padding (alapértelmezett 12).
  final EdgeInsetsGeometry? padding;

  const MainRecentCardWidget({super.key, this.color, this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: color ?? AppTheme.cardBackgroundColor,
      ),
      child: Padding(padding: padding ?? const EdgeInsets.all(12.0), child: child),
    );
  }
}
