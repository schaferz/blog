import 'package:flutter/material.dart';

/// Panel widget.
class TerCard extends StatelessWidget {
  /// Fejléc szöveg.
  final String headerText;

  /// Gyermek widget.
  final Widget child;

  /// Maximum szélesség.
  final double? maxWidth;

  const TerCard({super.key, this.headerText = '', required this.child, this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        constraints: _resolveBoxConstraints(),
        child: Padding(
          padding: EdgeInsetsGeometry.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(headerText, textAlign: TextAlign.start, style: TextStyle(fontSize: 18.0)),
              const SizedBox(height: 15),
              child,
            ],
          ),
        ),
      ),
    );
  }

  /// Visszatér a [BoxConstraints]-el ha van olyan tulajdonság amiért létrehozzik ([maxWidth]),
  /// egyébként null.
  BoxConstraints? _resolveBoxConstraints() {
    if (maxWidth != null) {
      return BoxConstraints(maxWidth: maxWidth!);
    } else {
      return null;
    }
  }
}
