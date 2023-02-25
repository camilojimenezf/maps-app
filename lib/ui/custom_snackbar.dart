import 'package:flutter/material.dart';

class CustomSnackbar extends SnackBar {
  CustomSnackbar({
    required String message,
    String btnLabel = 'OK',
    Duration duration = const Duration(seconds: 1),
    VoidCallback? onPress,
  }) : super(
          content: Text(message),
          duration: duration,
          action: SnackBarAction(
            label: btnLabel,
            onPressed: () {
              if (onPress != null) {
                onPress();
              }
            },
          ),
        );
}
