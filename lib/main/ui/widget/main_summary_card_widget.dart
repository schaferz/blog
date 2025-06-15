import 'package:blog/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Főoldalon használt kártya, mely összegző információkat jelenít meg.
class MainSummaryCardWidget extends StatelessWidget {
  /// Gyermek widget.
  final Widget child;

  /// Ikon színe.
  final Color? color;

  /// Padding.
  final EdgeInsetsGeometry? padding;

  const MainSummaryCardWidget({
    super.key,
    this.color,
    this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: color ?? AppTheme.cardBackgroundColor,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }
}
