// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shnam/screen/secondTab/five.dart';
import 'package:shnam/screen/secondTab/four.dart';
import 'package:shnam/screen/secondTab/secondTab.dart';

class SecondScreen extends StatefulWidget {
  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SecondTab(),
            Expanded(
              child: TabBarView(
                children: [
                  Four(),
                  Five()
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}