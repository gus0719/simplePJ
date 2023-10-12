import 'package:flutter/material.dart';
import 'package:shnam/login/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shnam/toastMsg/toastMsg.dart';

logout(BuildContext context) async{
  // ignore: no_leading_underscores_for_local_identifiers
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signOut();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => loginScreen()),
    );
  } catch (e) {
    showToast('로그아웃 실패');
  }
}