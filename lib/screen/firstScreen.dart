// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shnam/screen/firstTab/firstTab.dart';
import 'package:shnam/screen/firstTab/one.dart';
import 'package:shnam/screen/firstTab/three.dart';
import 'package:shnam/screen/firstTab/two.dart';


class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() => FirstScreenState();
}



class FirstScreenState extends State<FirstScreen>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            FirstTab(),
            Expanded(
              child: TabBarView(
                children: [
                  One(),
                  Two(),
                  Three()
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}