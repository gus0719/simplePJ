import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              addAutomaticKeepAlives: true,
              [
                for(int i = 0; i < 100; i++) IconButton(onPressed: () => print('d'), icon: Icon(Icons.border_all)) // 위젯 배치 테스트용
              ] 
            )
          )
        ],
      ),
    );
  }
}