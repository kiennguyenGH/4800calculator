import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  // const Button({super.key});

  final Color color;
  final Color fontColor;
  final String text;
  final onTapped;

  const Button({super.key, required this.color, required this.fontColor, required this.text, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          color: color,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: fontColor, fontSize: 30),

            ),
          ),
        ),
      ),
    );
  }
}
