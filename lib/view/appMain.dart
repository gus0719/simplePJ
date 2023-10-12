// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shnam/view/navigation/firstScreen.dart';
import 'package:shnam/view/navigation/secondScreen.dart';
import 'package:shnam/controller/onBackPressed.dart';
import 'package:shnam/view/navigation/home.dart';

// ignore: use_key_in_widget_constructors
class AppMain extends StatefulWidget {

  @override
  AppMainState createState() => AppMainState();
}

class AppMainState extends State<AppMain> {
  int _pageIndex = 0;
  final List<Widget> _page = [home(), firstScreen(), secondScreen()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: Scaffold(

        body: _page[_pageIndex],
    
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _pageIndex = index;
            });
          },
          currentIndex: _pageIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black12,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add),
              label: '리스트',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow_sharp),
              label: '플레이',
            ),
          ],
        ),
      )
    );
  }
}