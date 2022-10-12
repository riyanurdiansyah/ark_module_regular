import 'package:flutter/material.dart';

class ArkCategoryWidget extends StatelessWidget {
  const ArkCategoryWidget({
    Key? key,
    required this.title,
    required this.colorBorder,
    required this.margin,
    required this.textColor,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color colorBorder;
  final EdgeInsetsGeometry margin;
  final Color textColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 8,
      ),
      margin: margin,
      decoration: BoxDecoration(
          border: Border.all(color: colorBorder),
          color: color,
          borderRadius: BorderRadius.circular(6)),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 12.5,
        ),
      ),
    );
  }
}
