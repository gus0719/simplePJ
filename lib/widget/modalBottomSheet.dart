import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shnam/widget/toastMsg.dart';

Reference myRef = FirebaseStorage.instance.ref()
                    .child(FirebaseAuth.instance.currentUser!.email!)
                    .child('profileImage.png');
final myEmail = FirebaseAuth.instance.currentUser!.email!;
final FirebaseFirestore fireStore = FirebaseFirestore.instance;

void defaultImg() async {
  Reference dfRef = FirebaseStorage.instance.ref()
                      .child('profileImage.png');
  String profileURL = await dfRef.getDownloadURL();
  try{
    fireStore.collection('Users').doc(myEmail).update({ "profileImg": profileURL });
  } catch (e){
    showToast("$e");
  }
}
cameraImg() async {
  final pickedCamFile = await ImagePicker().pickImage(source: ImageSource.camera);
  if (pickedCamFile != null) {
    File pickFile = File(pickedCamFile.path);
    myRef.putFile(pickFile);
    String profileURL = await myRef.getDownloadURL();
    fireStore.collection('Users').doc(myEmail).update({ "profileImg": profileURL });
  }
}
getPhotoLibImg() async {
  final pickedLibFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedLibFile != null) {
    File pickFile = File(pickedLibFile.path);
    myRef.putFile(pickFile);
    String profileURL = await myRef.getDownloadURL();
    fireStore.collection('Users').doc(myEmail).update({ "profileImg": profileURL });
  }
}
showSheet(context) {
  return showModalBottomSheet(
    context: context, 
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25)
      )
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black
            ),
            onPressed: () {
              defaultImg();
              Navigator.pop(context);
            }, 
            child: Text('기본 프로필 이미지')
          ),
          Divider(thickness: 1),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black
            ),
            onPressed: () {
              cameraImg();
              Navigator.pop(context);
            },
            child: Text('사진 찍기')
          ),
          Divider(thickness: 1),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black
            ),
            onPressed: () {
              getPhotoLibImg();
              Navigator.pop(context);
            },
            child: Text('라이브러리에서 가져오기')
          )
        ],
      );
    }
  );
}