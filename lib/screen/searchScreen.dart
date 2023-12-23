import 'package:flutter/material.dart';

class Search extends StatefulWidget{
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search>{
  TextEditingController searchCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          controller: searchCtl,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            labelText: "검색",
            labelStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.white
          ),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.5
          )
        ),
      ),
    );
  }
}