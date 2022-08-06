import 'package:bid_it_farm/misc/colors.dart';
import 'package:bid_it_farm/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  IconData? icon;
  String? text;
  bool? isIcon;

   AppButtons({Key? key,
    this.isIcon = false,
    required this.color,
    required this.backgroundColor,
     required this.borderColor,
     required this.size,
     this.text,
     this.icon,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon == false?Center(child: AppText(text: text!, color: color,)): Center(child: Icon(icon, color: color,)),
    );
  }
}
