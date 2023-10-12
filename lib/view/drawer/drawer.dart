import 'package:flutter/material.dart';
import 'package:shnam/setting/settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shnam/toastMsg/toastMsg.dart';
import 'package:shnam/view/userInfo.dart';
import 'package:shnam/setting/setName/setName.dart';
import 'package:shnam/login/logout/logout.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class myDrawer extends StatelessWidget {
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
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("assets/dfImg.png"),
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
                  child: FutureBuilder<DocumentSnapshot>(
                    future: myName,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading...");
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else if (snapshot.hasData) {
                        Map<String, dynamic> userData =
                          snapshot.data!.data() as Map<String, dynamic>;
                        String userName = userData['name'];
                        return Text(userName);
                      } else {
                        return const Text("No Name");
                      }
                    }
                  ),
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