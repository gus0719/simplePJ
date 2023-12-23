// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shnam/widget/toastMsg.dart';

class FindPasswordScreen extends StatefulWidget {
  @override
  FindPasswordState createState() => FindPasswordState();
}

class FindPasswordState extends State<FindPasswordScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';

  Future<void> _resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("비밀번호 찾기", style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1),
        )
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              onChanged: (value) => email = value,
              decoration: const InputDecoration(
                labelText: 'Insert Email',
                hintText: 'Email',
                prefixIcon: Icon(Icons.contact_mail),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.black,
                  )
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    if(email.isEmpty) {
                      showToast('이메일을 입력해주세요');
                    } else if(email.contains("@") && email.contains(".com")){
                      showToast('재발급용 메일을 전송했습니다.');
                      _resetPassword(email);
                    } else {
                      showToast('올바른 이메일을 입력해주세요.');
                    }
                  },
                  icon: const Icon(Icons.outgoing_mail),
                  label: const Text('재발급'),
                  style: TextButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.black
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}