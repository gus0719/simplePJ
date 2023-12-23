import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        color: Colors.black,
      ),
      tabs: [
        Tab(child: Text('Four')),
        Tab(child: Text('Five'))
      ]
    );
  }
}