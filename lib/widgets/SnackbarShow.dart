import 'package:flutter/material.dart';

class SnackBarShow {
  final customMessage;
  SnackBarShow(this.customMessage);
  SnackBar showSnackBar(BuildContext context) {
    return SnackBar(
      content: Text(customMessage),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change.
          Scaffold.of(context).hideCurrentSnackBar();
        },
      ),
    );
  }
}
