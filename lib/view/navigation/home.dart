import 'package:flutter/material.dart';
import 'package:shnam/view/drawer/drawer.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class home extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55.0), 
        child: AppBar(
          centerTitle: true,
          title: const Text('홈'),
          // title: Image.asset('assets/app_logo.png', fit: BoxFit.cover), // 앱바 이미지 삽입
          elevation: 1.0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          shape: const Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1
            ),
          ), 
        ),
      ),  
      drawer: myDrawer(),
    );
  }
}