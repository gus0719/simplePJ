// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shnam/widget/borderField.dart';
import 'package:shnam/widget/toastMsg.dart';

TextEditingController nameController = TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;

void updateName() {
  final userNameReference = FirebaseFirestore.instance
      .collection('Users')
      .doc(_auth.currentUser!.email);
  userNameReference.update({"name": nameController.text});
}

void changeName(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          '닉네임 변경화면',
          style: TextStyle(color: Colors.black),
        ),
        content: BorderField(
            controller: nameController,
            labelText: "닉네임 입력",
            prefixIcon: const Icon(Icons.perm_identity)
        ),
        actions: [
          TextButton(
            onPressed: () {
              updateName();
              Navigator.pop(context);
              showToast('닉네임 변경 완료, ${nameController.text}');
            },
            child: const Text('변경', style: TextStyle(color: Colors.black),),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('취소', style: TextStyle(color: Colors.grey),),
          )
        ],
      );
    },
  );
}