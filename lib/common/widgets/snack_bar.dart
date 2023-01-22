import 'package:boats_list/features/boats_list/ui/styling/text_styles.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  final String message;
  final Color color;
  CustomSnackBar({
    Key? key,
    required this.message,
    required this.color,
  }) : super(
          key: key,
          duration: const Duration(milliseconds: 900),
          content: Text(
            message,
            style: tsBold15.copyWith(
              color: color,
            ),
          ),
        );
}

class ErrorSnackBar extends CustomSnackBar {
  ErrorSnackBar({
    super.key,
    required String message,
  }) : super(
          color: Colors.red,
          message: message,
        );
}

class MessageSnackBar extends CustomSnackBar {
  MessageSnackBar({
    super.key,
    required String message,
  }) : super(
          color: Colors.blue,
          message: message,
        );
}
