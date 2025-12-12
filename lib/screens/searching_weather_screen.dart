import 'package:flutter/material.dart';
import 'package:weather_app/constants/styles.dart';

class SearchingWeatherScreen extends StatelessWidget {
  const SearchingWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userSearchController = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: Styles.searchingBarStyle,
                child: TextField(
                  controller: userSearchController,
                  cursorColor: Colors.white,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search City',
                    hintStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: Colors.white),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
