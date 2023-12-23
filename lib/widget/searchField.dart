import 'package:flutter/material.dart';
import 'package:shnam/controller/disableField.dart';
import 'package:shnam/screen/searchScreen.dart';

Widget searchField(BuildContext context) {
  return SizedBox(
    height: 45,
    child: TextField(
      enableInteractiveSelection: true,
      readOnly: true,
      focusNode: AlwaysDisabledFocusNode(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.search),
        hintText: "검색",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Search())
        );
      },
    )
  );
}