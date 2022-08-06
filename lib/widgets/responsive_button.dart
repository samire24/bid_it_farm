import 'package:bid_it_farm/misc/colors.dart';
import 'package:bid_it_farm/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {

  bool isResponsive;
  double? width;
  ResponsiveButton({Key? key,
     this.width=120,
    this.isResponsive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 60,
          width: isResponsive==true?double.maxFinite:width,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment:isResponsive==true? MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(margin: const EdgeInsets.only(left: 20),child: AppText(text: "Go To Cart", color: Colors.white,)):Container(),
            Image.asset("assets/img/cash-flow.png")
          ],
        ),
      ),
    );
  }
}
