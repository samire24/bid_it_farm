import 'package:bid_it_farm/cubits/app_cubit.dart';
import 'package:bid_it_farm/misc/colors.dart';
import 'package:bid_it_farm/widgets/app_large_text.dart';
import 'package:bid_it_farm/widgets/app_text.dart';
import 'package:bid_it_farm/widgets/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "farm.jpg",
    "peppers.jpg",
    "pigs.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/"+ images[index]),
                fit: BoxFit.cover
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset.zero,
                  blurStyle: BlurStyle.normal
                )
              ],
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150,right: 20,left: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Buy",color: Colors.white,),
                      AppText(text: "From Farm",size: 30,color: Colors.white,),
                      SizedBox(height: 20,),
                      Container(
                        width: 250,
                        child: AppText(
                            text: "You can buy all your food products directly from the farm without hassle. Search for each category of farm and purchase at your cheap price. Get it delivered at your doorstep with a discount",
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                      SizedBox(height: 40,),
                      GestureDetector(
                          onTap: (){
                            BlocProvider.of<AppCubit>(context).getData();
                          },
                          child: Container(
                              width: 200,
                              child: Row(
                                children: [
                                  ResponsiveButton(width: 120,),
                                ],
                              )))
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) => Container(
                      margin: EdgeInsets.only(bottom: 2),
                      height: index ==indexDots? 25:8,
                      width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                      ),
                    )),
                  )
                ],
              ),
            ),
          );
          }

      ),
    );
  }
}
