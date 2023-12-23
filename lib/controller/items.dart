import 'package:flutter/material.dart';

class NavigationItems {
  static List<BottomNavigationBarItem> navigationBarItems = [
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
  ];

  static BottomNavigationBar navigationBar = BottomNavigationBar(
    items: navigationBarItems,
    type: BottomNavigationBarType.fixed
  );
}