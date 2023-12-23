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
                for(int i = 1; i <= 100; i++) Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("$i Line"), Divider()
                  ],
                )
              ] 
            )
          )
        ],
      ),
    );
  }
}