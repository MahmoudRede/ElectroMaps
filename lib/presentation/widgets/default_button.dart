import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String content;
  TextStyle style;
  double height;
  double width;
  Color backGroundColor;

  DefaultButton({required this.backGroundColor, required this.height, required this.width, required this.style, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:  ElevatedButton.styleFrom(
        backgroundColor: backGroundColor,
        shape: const StadiumBorder(),
        minimumSize:   Size(width, height),
      ),
      onPressed: () {},
      child: Text(content, style: style),
    );
  }
}
