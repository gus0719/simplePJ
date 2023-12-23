import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

StreamBuilder<DocumentSnapshot<Map<String, dynamic>>> profileImageStream() {
  return StreamBuilder(
    stream: FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
      try {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Icon(Icons.block, size: 35,);
        } else if (!snapshot.hasData || !snapshot.data!.exists) {
          return CircleAvatar(
            backgroundImage: AssetImage("assets/profileImage.png"));
        } else {
          var data = snapshot.data!.data();
          var profileURL = data?['profileImg'] ?? '';
          return CircleAvatar(
            backgroundImage: NetworkImage(profileURL),
            radius: 35,
          );
        }
      } catch (e) {
        return CircleAvatar(
            backgroundImage: AssetImage("assets/profileImage.png"));
      }
    }
  );
}
