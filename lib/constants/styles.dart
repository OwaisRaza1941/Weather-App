import 'package:flutter/material.dart';

class Styles {
  static final weatherScreenBg = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.blue.shade200, Colors.grey.shade200],
    ),
  );

  static final searchingBarStyle = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(40),
  );

  static final textFieldsStyle = InputDecoration(
    hintText: 'Search for a city....',
    hintStyle: TextStyle(color: Colors.black),
    contentPadding: EdgeInsets.symmetric(vertical: 15),
    prefixIcon: Icon(Icons.search),
    filled: true,
    fillColor: Colors.grey.shade200,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
  );
}
