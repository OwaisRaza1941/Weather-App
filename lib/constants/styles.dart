import 'package:flutter/material.dart';

class Styles {
  static final searchingBarStyle = BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        blurRadius: 10,
        color: Colors.white.withOpacity(0.3),
        spreadRadius: 6,
        offset: Offset(5, 5),
      ),
    ],
  );
}
