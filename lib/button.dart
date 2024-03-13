import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  // const Button({super.key});

  final Color color;
  final Color fontColor;
  final String text;
  final double height;
  final double width;

  Button({required this.color, required this.fontColor, required this.text, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        height: height,
        child: Container(
          color: color,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: fontColor, fontSize: 30),

            ),
          ),
        )
      ),
    );
  }
}
