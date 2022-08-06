import 'package:bid_it_farm/cubits/app_cubit.dart';
import 'package:bid_it_farm/misc/colors.dart';
import 'package:bid_it_farm/widgets/app_large_text.dart';
import 'package:bid_it_farm/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images ={
    "bill.png" : "Bill",
    "cash-flow.png": "Cash",
    "credit-card.png": "Credit",
    "statistics.png": "Statistics",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitState>(
          builder: (context, state){
            if (state is LoadedState){
              var info= state.places;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // menu text
                  Container(
                    padding: const EdgeInsets.only(top: 70,left: 20),
                    child: Row(
                      children: [
                        const Icon(Icons.menu,size: 30,color: Colors.black54,),
                        Expanded(child: Container()),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25,),
                  //discover text
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: AppLargeText(text: "Discover",)
                  ),

                  const SizedBox(height: 20,),
                  //tabbar
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding: const EdgeInsets.only(left: 20, right: 20),
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndicator(color: AppColors.mainColor,radius: 4),
                        tabs: [
                          Tab(text: "Places",),
                          Tab(text: "Inspiration",),
                          Tab(text: "Emotions",),
                        ],
                      ),
                    ),
                  ),
                  //tabbar View
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                              itemCount:info.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index){
                                return GestureDetector(
                                  onTap: (){
                                    BlocProvider.of<AppCubit>(context).detailPage(info[index]);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10, right: 15),
                                    height: 300,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+ info[index].img),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }
                          ),
                          Text("Hello"),
                          Text("Here"),
                        ]),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Explore More", size: 22,),
                        AppText(text: "See all", color: AppColors.textColor1,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 120,
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_,index){
                          return Container(
                            margin: EdgeInsets.only(right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // margin: const EdgeInsets.only(right: 50),
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage("assets/img/"+ images.keys.elementAt(index)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                ),
                                SizedBox(height: 10,),
                                Container(
                                  child: AppText(text: images.values.elementAt(index),
                                    color: AppColors.textColor2,),
                                )
                              ],
                            ),
                          );

                        }),
                  ),
                ],
              );
            }
            else
              {
                return Container();
              }
          }
      ),
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color,required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color,required this.radius});
  @override
  void paint(Canvas canvas, Offset offset,
      ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias=true;
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height-radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
  
}