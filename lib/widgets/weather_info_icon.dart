import 'package:flutter/material.dart';

class WeatherInfoItem extends StatelessWidget {
  final String icon;
  final String title;
  final String value;

  const WeatherInfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double boxSize = constraints.maxWidth * 0.45;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(boxSize * 0.4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(boxSize * 0.22),
                child: Image.asset(icon, color: Colors.black),
              ),
            ),
            SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                fontSize: constraints.maxWidth * 0.14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              value,
              style: TextStyle(fontSize: constraints.maxWidth * 0.14),
            ),
          ],
        );
      },
    );
  }
}
