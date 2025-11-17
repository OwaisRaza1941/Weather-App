import 'package:flutter/material.dart';

class TempatureDeggree extends StatelessWidget {
  const TempatureDeggree({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '24',
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Transform.translate(
          offset: Offset(2, 12),
          child: Text(
            '°C',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
