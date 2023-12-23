import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shnam/screen/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shnam/screen/appMain.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyFirstApp());
}

class MyFirstApp extends StatefulWidget {
  @override
  MyFirstAppState createState() => MyFirstAppState();
}

class MyFirstAppState extends State<MyFirstApp> {

  // Shared Preferences 자동 로그인 토큰 확인
  Future<String> _loadUserInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false, // 디버그 true: 활성화 false: 비활성화
      home: FutureBuilder<String>(
        future: _loadUserInfo(),
        initialData: '',
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          }
          else if(snapshot.hasData) {
            // Firebase에 등록된 사용자의 이메일
            User? user = FirebaseAuth.instance.currentUser;
            String userEmail = user?.email ?? '';
            
            // Firebase에 등록된 이메일과 비교했을 때
            if(snapshot.data!.isEmpty && snapshot.data != userEmail) {
              // 일치하면 로그인 화면으로 반환
              return LoginScreen();
            }
            else if(snapshot.data!.isNotEmpty && snapshot.data == userEmail){
              // 일치하면 앱 메인 화면 반환
              return AppMain();
            }
            else {
              return LoginScreen();
            }
          } else {
            return LoginScreen();
          }
        }
      )
    );    
  }
}