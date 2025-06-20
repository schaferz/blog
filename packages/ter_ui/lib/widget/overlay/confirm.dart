import 'package:flutter/material.dart';

/// Megerősítés kérő dialógus megjelenítése logikai eredménnyel.
Future<bool> showConfirmDialog(BuildContext context, String message) async {
  Widget cancelButton = ElevatedButton(
    child: Text("Mégse"),
    onPressed: () {
      Navigator.of(context).pop(false);
    },
  );
  Widget okButton = ElevatedButton(
    child: Text("Ok"),
    onPressed: () {
      Navigator.of(context).pop(true);
    },
  );
  AlertDialog alert = AlertDialog(content: Text(message), actions: [cancelButton, okButton]);

  final result = await showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

  return result ?? false;
}
