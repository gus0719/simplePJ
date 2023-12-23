import 'package:flutter/material.dart';
import 'package:shnam/screen/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shnam/widget/toastMsg.dart';
import 'package:shared_preferences/shared_preferences.dart';

logout(BuildContext context) async{
  FirebaseAuth auth = FirebaseAuth.instance;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    await auth.signOut();
    
    // 자동 로그인 토큰 삭제
    prefs.remove('email');
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  } catch (e) {
    showToast('로그아웃 실패');
  }
}