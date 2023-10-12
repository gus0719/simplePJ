import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shnam/borderField/borderField.dart';
import 'package:shnam/login/loginScreen.dart';
import 'package:shnam/toastMsg/toastMsg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class registerScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _registerScreenState createState() => _registerScreenState();
}

// ignore: camel_case_types
class _registerScreenState extends State<registerScreen>{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyPasswordController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();
  
  String _birthDay = '';
  // ignore: prefer_final_fields
  TextEditingController _smsCodeController = TextEditingController();

  bool _codeSent = false;
  bool buttonPush = false;
  bool verify = false;

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  late String _verificationId;
  
  // 생년월일 설정
  Future _birthSet() async{
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if(selected != null) {
      setState(() {
        _birthDay = (DateFormat.yMMMd()).format(selected);
      });
    }
  }
  // 휴대폰 인증
  Future<void> _sendSMSCode() async {
    final String phoneNumber = phoneNumberController.text;
    try{
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
        },
        verificationFailed: (FirebaseAuthException e) {
          showToast('코드 전송 실패. ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          showToast('코드 전송 완료. ${phoneNumberController.text}');
          setState(() {
            _codeSent = true;
            _verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          showToast('시간초과');
          setState(() {
            _codeSent = false;
          });
        }
      );
    } catch (e) {
      showToast('알 수 없는 오류. $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      /* 배경 사진 추가
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/signup_bg.png'),
        ),
      ), */
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('회원가입', style: TextStyle(color: Colors.black),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(  // 닉네임 입력
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('이름'),
                  const SizedBox(width: 50),
                  Expanded(
                    child: borderField(
                      controller: nameController,
                      labelText: "닉네임",
                      prefixIcon: const Icon(Icons.tag)
                    )
                  )
                ]
              ),
              const SizedBox(height: 10.0),   
              Row(  // 이메일 입력
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('이메일'),
                  const SizedBox(width: 52),
                  Expanded(
                    child: borderField(
                      controller: emailController,
                      labelText: '이메일',
                      prefixIcon: const Icon(Icons.email_outlined)
                    )
                  )
                ]
              ),
              const SizedBox(height: 10.0),
              Row(  // 비밀번호 입력
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('비밀번호'),
                  const SizedBox(width: 40),
                  Expanded(
                    child: borderField(
                      controller: passwordController,
                      obscureText: true,
                      labelText: '비밀번호',
                      prefixIcon: const Icon(Icons.password)
                    )
                  )
                ]
              ),
              const SizedBox(height: 5.0),
              Row(  // 비밀번호 재입력
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('비밀번호 확인'),
                  const SizedBox(width: 12),
                  Expanded(
                    child: borderField(
                      controller: verifyPasswordController,
                      obscureText: true,
                      labelText: '비밀번호 재입력',
                      prefixIcon: const Icon(Icons.repeat)
                    )
                  )
                ]
              ),
              const SizedBox(height: 10.0),
              Row(  // 전화번호 인증
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('전화번호'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IntlPhoneField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (phone) {
                              setState(() {
                                phoneNumberController.text = phone.completeNumber;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ),
                  SizedBox(
                    width: 80,
                    height: 50,
                    child: TextButton.icon(
                      onPressed: () async {
                        _sendSMSCode();
                      },
                      icon: const Icon(Icons.perm_phone_msg),
                      label: const Text("인증 요청"),
                      style: TextButton.styleFrom(
                        iconColor: Colors.black,
                        // ignore: deprecated_member_use
                        primary: Colors.black,
                        minimumSize: const Size(50, 50),
                      ),
                    )
                  )
                ]
              ), 
              const SizedBox(height: 10.0),
              Visibility(  // 인증번호 입력
                visible: _codeSent == true,
                child: 
                  Row(
                    children: [
                      Expanded(
                        child: borderField(
                          controller: _smsCodeController,
                          keyboardType: TextInputType.number,
                          labelText: '인증번호',
                          prefixIcon: const Icon(Icons.domain_verification)
                        )
                      ),
                      SizedBox(
                        width: 80,
                        height: 50,
                        child: TextButton.icon(
                          onPressed: () async {
                            // ignore: unused_local_variable
                            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                              verificationId: _verificationId,
                              smsCode: _smsCodeController.text
                            );
                            try{
                              verify = true;       // 인증 완료
                              _codeSent = false;   // visibie off
                              showToast('인증완료');
                            } catch (e) {
                              showToast('인증 실패: $e');
                            }
                          },
                          icon: const Icon(Icons.check),
                          label: const Text("확인"),
                          style: TextButton.styleFrom(
                            iconColor: Colors.black,
                            // ignore: deprecated_member_use
                            primary: Colors.black,
                            minimumSize: const Size(50, 50),
                          ),
                        )
                      )
                    ]
                  ),
                ),
              const SizedBox(height: 10.0),
              Row( // 생년월일 설정
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextButton.icon(
                    onPressed: () {
                      _birthSet();
                    },
                    icon: const Icon(Icons.cake_outlined),
                    label: Text(_birthDay),
                    style: TextButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: Colors.black
                    ),
                  ),
                ]
              ),
              const SizedBox(height: 16.0),
              Row(  // 파이어베이스 유저 정보 업로드
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  TextButton.icon(
                    onPressed: () async{
                      if(
                        nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty && // 올바른 이메일 판별
                        passwordController.text.isNotEmpty &&
                        passwordController.text.length >= 8 &&  // 비밀번호 8자리 이상
                        passwordController.text == verifyPasswordController.text &&
                        verify == true &&
                        _birthDay.isNotEmpty
                      ) {
                        showToast('회원가입 완료');

                        // 파이어베이스 유저정보 업로드
                        final String email = emailController.text;
                        final String name = nameController.text;
                        final String birthDay = _birthDay;
                        final String phoneNo = phoneNumberController.text;

                        fireStore.collection('Users').doc(emailController.text).set({
                          "email": email,
                          "name": name,
                          "age" : birthDay,
                          "Phone Number" : phoneNo
                        });
                        await _auth.createUserWithEmailAndPassword(
                          email: emailController.text, password: passwordController.text
                        );
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => loginScreen()),
                        );
                      } else if(nameController.text.isEmpty) {
                        showToast('닉네임 입력해주세요');
                      } else if(emailController.text.isEmpty) {
                        showToast('이메일 입력해주세요');
                      } else if(passwordController.text.isEmpty) {
                        showToast('비밀번호 입력해주세요');
                      } else if(passwordController.text != verifyPasswordController.text){
                        showToast('비밀번호가 일치하지 않습니다.');
                      } else if(verify != true) {
                        showToast('SMS 인증해주세요');
                      } else if(_birthDay.isEmpty) {
                        showToast('생년월일 설정해주세요');
                      }
                    },
                    icon: const Icon(Icons.email_outlined),
                    label: const Text('회원가입'),
                    style: TextButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.black
                      )
                    )
                  ),
                ]
              ),
            ]
          )
        ),
      )
    );
  }
}