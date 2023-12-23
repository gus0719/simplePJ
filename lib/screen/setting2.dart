import 'package:flutter/material.dart';

class Setting2Screen extends StatefulWidget {
  @override
  Setting2ScreenState createState() => Setting2ScreenState();
}

class Setting2ScreenState extends State<Setting2Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('설정 2', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1),
        )
      ),
    );
  }
}