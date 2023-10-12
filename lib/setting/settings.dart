import 'package:flutter/material.dart';
//import 'package:shnam/setting/settingList/setting1.dart';
//import 'package:shnam/setting/settingList/setting2.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class settings extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _settingsState createState() => _settingsState();
}

// ignore: camel_case_types
class _settingsState extends State<settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('설정 화면', style: TextStyle(color: Colors.black),),
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