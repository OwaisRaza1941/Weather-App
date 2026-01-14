import 'package:flutter/material.dart';
import 'package:weather_app/constants/styles.dart';

class SearchBarCity extends StatelessWidget {
  final TextEditingController controller;
  final Future<void> Function(String) onSearch;
  const SearchBarCity({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.7,
          child: TextField(
            textInputAction: TextInputAction.search,
            onSubmitted: (value) async {
              await onSearch(value);
            },
            controller: controller,
            cursorColor: Colors.black,
            style: TextStyle(fontSize: 16, color: Colors.black),
            decoration: Styles.textFieldsStyle,
          ),
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey.shade200,
          child: Transform.rotate(
            angle: -1, // radians mein hota hai
            child: Icon(Icons.nightlight_sharp, size: 30, color: Colors.purple),
          ),
        ),
      ],
    );
  }
}
