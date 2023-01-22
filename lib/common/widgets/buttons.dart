import 'package:boats_list/features/boats_list/ui/styling/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/boats_list/state/boat_list_change_notifier.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color color;

  const ActionButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: tsBold15,
      backgroundColor: color,
    );
    return ElevatedButton(
      style: style,
      onPressed: onTap,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class BigButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const BigButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: tsBold17);

    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: style,
        onPressed: onTap,
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
