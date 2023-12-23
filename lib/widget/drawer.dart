import 'package:flutter/material.dart';
import 'package:shnam/screen/settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shnam/services/loadUserName.dart';
import 'package:shnam/services/userImg.dart';
import 'package:shnam/widget/toastMsg.dart';
import 'package:shnam/services/setName.dart';
import 'package:shnam/services/logout.dart';
import 'package:shnam/widget/modalBottomSheet.dart';
import 'package:shnam/screen/userInfo.dart';

class MyDrawer extends StatelessWidget {
  final myName = FirebaseFirestore.instance
                      .collection('Users')
                      .doc(FirebaseAuth.instance.currentUser!.email)
                      .get();
  final myEmail = FirebaseAuth.instance.currentUser!.email!;

  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(     // 프로필 사진 설정
            currentAccountPicture: GestureDetector(
              onTap: () {
                showSheet(context);
              },
              child: profileImageStream()
            ), 
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.zero, bottom: Radius.circular(20)
              ),
              color: Colors.black
            ),
            accountName: Row(
              children: [
                Expanded(
                  child: LoadUserName()
                ),
                SizedBox(
                  width: 60,
                  height: 25,
                  child: IconButton(
                    onPressed: () {
                      changeName(context);
                    },
                    icon: const Icon(Icons.drive_file_rename_outline),
                    color: Colors.white,
                  )
                )
              ]
            ),
            accountEmail: Text(myEmail),
          ),
          Divider(),          
          ListTile(
            leading: const Icon(Icons.perm_identity),
            title: const Text('사용자 정보'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => userInfo()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('설정'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => settings()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('로그아웃'),
            onTap: () {
              logout(context);
              showToast('로그아웃');
            },
          ),
        ],
      ),
    );
  }
}