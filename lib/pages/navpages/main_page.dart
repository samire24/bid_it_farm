import 'package:bid_it_farm/pages/navpages/bar_item_page.dart';
import 'package:bid_it_farm/pages/navpages/home_page.dart';
import 'package:bid_it_farm/pages/navpages/my_page.dart';
import 'package:bid_it_farm/pages/navpages/search_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages =[
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0.0,

        items: [
        BottomNavigationBarItem(icon: Icon(Icons.apps),title: Text("Home"),),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp),title: Text("Menu"),),
        BottomNavigationBarItem(icon: Icon(Icons.search),title: Text("Search"),),
        BottomNavigationBarItem(icon: Icon(Icons.person),title: Text("Profile"),),
      ],
        // child: Padding(padding: EdgeInsets.only(top: 8),
        // child: Row(
        //   children: [
        //     IconButton(onPressed: (){}, icon: Icon(Icons.apps,size: 16,),),
        //     IconButton(onPressed: (){}, icon: Icon(Icons.stacked_bar_chart,size: 16,),),
        //     IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 16,),),
        //     IconButton(onPressed: (){}, icon: Icon(Icons.person,size: 16,),),
        //   ],
        // ),
        // ),
      ),
    );
  }
}
