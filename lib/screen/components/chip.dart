import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChipText extends StatelessWidget {
  final Color color;
  final double? height;
  final double? width;
  final String title;
  Color? textColor;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  VoidCallback? onPressed;
  bool? selectedIndex;
  final TypeChip typeChip;

  ChipText.normal(
      {super.key,
      required this.color,
      this.height,
      this.width,
      required this.title,
      this.textColor,
      this.padding,
      this.margin,
      this.typeChip = TypeChip.normal});

  ChipText.action(
      {super.key,
      required this.color,
      required this.height,
      this.width,
      required this.title,
      this.textColor,
      this.padding,
      this.margin,
      required this.onPressed,
      required this.selectedIndex,
      this.typeChip = TypeChip.action});

  @override
  Widget build(BuildContext context) {
    return _typeChip();
  }

  Widget _typeChip() {
    if (typeChip == TypeChip.normal) {
      return Container(
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(52),
            color: color,
          ),
          margin: margin ?? const EdgeInsets.only(right: 8),
          child: Text(
            title,
            style: TextStyle(color: textColor ?? Colors.black),
          ));
    } else {
      return InkWell(
        onTap: onPressed,
        child: Container(
            padding: padding ??
                const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(52),
              color: selectedIndex! ? Colors.lightBlue[100] : color,
            ),
            margin: margin ?? const EdgeInsets.only(right: 8),
            child: Text(title,
            style: TextStyle(color: selectedIndex! ? Colors.blue[900] : textColor,fontWeight: FontWeight.bold),
            )),
      );
    }
  }
}

enum TypeChip { normal, action }
