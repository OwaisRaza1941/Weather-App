import 'package:flutter/material.dart';

class TempatureDeggree extends StatelessWidget {
  final String tempature;
  const TempatureDeggree({super.key, required this.tempature});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tempature,
          style: TextStyle(
            fontSize: size.height * 0.10,
           fontWeight: FontWeight.w300,
          ),
        ),
        Transform.translate(
          offset: Offset(2, 12),
          child: Text(
            '°C',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
