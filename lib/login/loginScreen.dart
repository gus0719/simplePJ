// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shnam/borderField/borderField.dart';
import 'package:shnam/toastMsg/toastMsg.dart';
import 'package:shnam/view/appMain.dart';
import 'package:shnam/login/resetPW/resetPassword.dart';
import 'package:shnam/login/register/register.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class loginScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _loginScreenState createState() => _loginScreenState();
}

// ignore: camel_case_types
class _loginScreenState extends State<loginScreen>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email = '';
  String password = '';

  // 체크시 이전에 로그인한 이메일 불러오기
  bool rememberEmail = false;

  // 앱 재실행 시 초기화
  @override
  void initState() {
    super.initState();
  }

  // 로그인 함수
  Future<void> _loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AppMain()),
      ); 
      showToast('${userCredential.user?.email}님 환영합니다');
    } catch (e) { // 로그인 실패, 사유
      if(e is FirebaseAuthException) {
        switch(e.code) {
          case 'user-not-found':
            showToast('사용자를 찾을 수 없음');
            break;
          case 'wrong-password':
            showToast('잘못된 비밀번호');
            break;
          default:
            showToast('로그인 실패: ${e.message}');
            break;
        }
      } else {
        // 기타 예외 처리
        showToast('로그인 실패 : $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            borderField(
              controller: _emailController,
              labelText: '이메일',
              prefixIcon: const Icon(Icons.email)
            ),
            const SizedBox(height: 16.0),
            borderField(
              controller: _passwordController,
              obscureText: true,
              labelText: "비밀번호",
              prefixIcon: const Icon(Icons.key)
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                _loginWithEmailAndPassword(_emailController.text, password);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent
              ),
              label: const Text('로그인'),
              icon: const Icon(Icons.login),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => findPasswordScreen()),);
                  },
                  icon: const Icon(Icons.quick_contacts_mail_rounded, color: Colors.black,),
                  label: const Text("비밀번호를 잊으셨나요?", style: TextStyle(color: Colors.black)),
                  style: TextButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                      
                    side: const BorderSide(
                      color: Colors.black,
                    )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => registerScreen()),
                    );
                  },
                  icon: const Icon(Icons.supervised_user_circle),
                  label: const Text('회원가입'),
                  style: TextButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.black87,
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.black
                    )
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}