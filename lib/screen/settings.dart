import 'package:flutter/material.dart';
import 'package:shnam/screen/setting1.dart';
import 'package:shnam/screen/setting2.dart';

class settings extends StatefulWidget {
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<settings> {

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('설정 1', style: TextStyle(color: Colors.black),),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => Setting1Screen())
              );
            }
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('설정 2'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => Setting2Screen())
              );
            },
          )
        ],
      )
    );
  }
}