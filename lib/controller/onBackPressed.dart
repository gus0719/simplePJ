// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 뒤로가기 이벤트
onBackPressed(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        '뒤로가기 버튼을 누르셨어요',
        style: TextStyle(color: Colors.black),
      ),
      content: const Text('앱을 종료하시겠습니까?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          child: const Text('네'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('아니오'),
        )
      ],
    )
  );
}
