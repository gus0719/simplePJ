// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shnam/controller/nav_clickListener.dart';
import 'package:shnam/widget/drawer.dart';
import 'package:shnam/screen/firstScreen.dart';
import 'package:shnam/screen/secondScreen.dart';
import 'package:shnam/controller/onBackPressed.dart';
import 'package:shnam/screen/home.dart';
import 'package:shnam/controller/items.dart';
import 'package:shnam/widget/searchField.dart';

class AppMain extends StatefulWidget {

  @override
  AppMainState createState() => AppMainState();
}

class AppMainState extends State<AppMain> {
  int pageIndex = 0;
  final List<Widget> page = [Home(), FirstScreen(), SecondScreen()]; // 네비게이션 뷰

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: Scaffold(
        drawer: MyDrawer(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: homeScr ? searchField(context) : Text(pageTitle),
              floating: true,   // 스크롤 시 상단 고정 여부
              pinned: true,     // 상단 고정 여부
              backgroundColor: Colors.black,
              iconTheme: IconThemeData(color: Colors.white),
              actions: <Widget>[
                IconButton(onPressed: () => print(''), icon: Icon(Icons.message_rounded))
              ],
            ),
            SliverFillRemaining(
              child: page[pageIndex]
            )  // 네비게이션 커스텀 스크롤
          ],
        ),
        
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(20.0, 5.0),
            topRight: Radius.elliptical(20.0, 5.0),
          ),
          child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                pageIndex = index;
                navTapClicklistener(index);
              });
            },
            currentIndex: pageIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: NavigationItems.navigationBar.items,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            backgroundColor: Colors.black,
          ),
        )
      )
    );
  }
}