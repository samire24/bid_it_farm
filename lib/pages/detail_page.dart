import 'package:bid_it_farm/cubits/app_cubit.dart';
import 'package:bid_it_farm/misc/colors.dart';
import 'package:bid_it_farm/widgets/app_buttons.dart';
import 'package:bid_it_farm/widgets/app_large_text.dart';
import 'package:bid_it_farm/widgets/app_text.dart';
import 'package:bid_it_farm/widgets/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars= 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, CubitState>(
       builder: (context, state) {
         DetailState details = state as DetailState;
      return Scaffold(
       body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+ details.place.img),
                    fit: BoxFit.cover),
                  ),
                ),
            ),
            Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      BlocProvider.of<AppCubit>(context).goHome();
                    },
                        icon: Icon(Icons.menu,color: Colors.white,),
                    ),
                  ],
            )),
            Positioned(
                top: 320,
                child: Container(
                  padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              height: 500,
              width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: details.place.name,color: Colors.black54.withOpacity(0.8),),
                          AppLargeText(text: "\$"+details.place.price.toString(), color: AppColors.mainColor,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.mainColor,),
                          SizedBox(width: 5,),
                          AppText(text: details.place.location, color: AppColors.textColor1,)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Wrap(
                            children:
                              List.generate(5, (index) {
                                return Icon(Icons.star, color:index<details.place.stars? AppColors.starColor: AppColors.textColor2,);
                              }
                              )
                          ),
                          SizedBox(width: 10,),
                          AppText(text: "(5.0)",color: AppColors.textColor2,),
                        ],
                      ),
                      SizedBox(height: 25,),
                      AppLargeText(text: "CASSAVA",color: Colors.black.withOpacity(0.8),size: 20,),
                      SizedBox(height: 5,),
                      AppText(text: "Number of farms in this category", color: AppColors.mainTextColor,),
                      SizedBox(height: 10,),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                color: selectedIndex==index?Colors.white: Colors.black,
                                  backgroundColor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                                  borderColor: selectedIndex==index? Colors.black:AppColors.buttonBackground,
                                  size: 50,
                              text: (index+1).toString(),),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 20,),
                          AppLargeText(text: "Description", size: 20,color: Colors.black.withOpacity(0.8),),
                          SizedBox(height: 10,),
                          AppText(text: details.place.description,
                          color: AppColors.mainTextColor,),
                      SizedBox(height: 20,),



                    ],
                  ),
            ),
            ),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor1,
                        size: 60,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(width: 20,),
                    ResponsiveButton(
                        isResponsive: true,)
                  ],
                ))



          ],
        ),
      ),
    );
  },
);
  }
}
