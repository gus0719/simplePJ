import 'package:flutter/material.dart';

class Setting1Screen extends StatefulWidget {
  @override
  Setting1ScreenState createState() => Setting1ScreenState();
}

class Setting1ScreenState extends State <Setting1Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('설정 1', style: TextStyle(color: Colors.black),),
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