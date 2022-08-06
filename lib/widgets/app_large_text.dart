import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final Color color;
  final String text;
  AppLargeText({Key? key, this.size= 30,
    this.color = Colors.black54,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
