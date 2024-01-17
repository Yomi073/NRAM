import 'package:flutter/material.dart';
import 'package:pv_smart_click/config/theme/app_themes.dart';

class MyButton extends StatelessWidget {
  final Function(BuildContext context)? onTap;
  final String labelText;

  const MyButton({
    super.key,
    required this.labelText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(context),
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            labelText,
            selectionColor: Colors.white,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
