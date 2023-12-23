// ignore_for_file: file_names
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';


class userInfo extends StatefulWidget {
  @override
  _userInfoState createState() => _userInfoState();
}

class _userInfoState extends State<userInfo> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('사용자 정보', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1
          ),
        )
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}