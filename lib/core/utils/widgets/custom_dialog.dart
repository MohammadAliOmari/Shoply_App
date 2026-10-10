import 'package:flutter/material.dart';
import 'package:pro_dialog/pro_dialog.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static void showCustomDialog({
    required BuildContext context,
    required String title,
    required String description,
    required void Function() onPressed,
    required DialogType type,
  }) {
    showProDialog(
      context,
      type: type,
      title: title,
      description: description,
      buttons: [
        DialogButton(text: 'Got it', onPressed: onPressed, isPrimary: true),
      ],
    );
  }
}
