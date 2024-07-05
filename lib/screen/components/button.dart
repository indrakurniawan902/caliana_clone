import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final double height;
  final double width;
  final String textButton;
  final Color sideColor;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isDisable;
   const Button({
    super.key,required this.onPressed, required this.height,required this.width,required this.textButton,required this.sideColor,this.backgroundColor,this.textColor,this.isDisable
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          side:  BorderSide(
              width: 1.5, color: sideColor),
        ),
        onPressed: isDisable == true ? null : onPressed,
        child:  Text(
          textButton,
          style:   TextStyle(color: textColor ?? Colors.black),
        ),
      ),
    );
  }
}