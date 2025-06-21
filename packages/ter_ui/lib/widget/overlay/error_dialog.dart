import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// Hiba dialógus szöveggel ([message]).
class ErrorDialog extends StatelessWidget {
  /// A megjelenített hibaszöveg.
  final String message;

  const ErrorDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: AlertDialog(
        icon: const Icon(Icons.dangerous_rounded, size: 64.0),
        iconColor: Colors.white,
        backgroundColor: Colors.red.withAlpha((255.0 * 0.9).round()),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// Dialógus megjelenítése a kapott szöveggel ([message]).
  static showErrorDialog(BuildContext context, String message) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (_) => ErrorDialog(message: message),
      );
    });
  }
}
