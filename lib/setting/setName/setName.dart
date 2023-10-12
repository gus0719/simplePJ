// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shnam/borderField/borderField.dart';
import 'package:shnam/toastMsg/toastMsg.dart';

TextEditingController _nameController = TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;

void updateName() {
  final userNameReference = FirebaseFirestore.instance
      .collection('Users')
      .doc(_auth.currentUser!.email);
  userNameReference.update({"name": _nameController.text});
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
        content: borderField(
            controller: _nameController,
            labelText: "닉네임 입력",
            prefixIcon: const Icon(Icons.perm_identity)),
        actions: [
          TextButton(
            onPressed: () {
              updateName();
              Navigator.pop(context);
              showToast('닉네임 변경 완료, $_nameController.text');
            },
            child: const Text('변경'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('취소'),
          )
        ],
      );
    },
  );
}
