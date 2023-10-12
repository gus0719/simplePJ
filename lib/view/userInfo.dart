// ignore_for_file: file_names
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class userInfo extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _userInfoState createState() => _userInfoState();
}

// ignore: camel_case_types
class _userInfoState extends State<userInfo> {
  // 카메라, 갤러리 사진 추출
  // XFile? _pickedFile; // 카메라, 갤러리 사진 가져옴

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
            width: 1),
        )
      ),
    );
  }
}