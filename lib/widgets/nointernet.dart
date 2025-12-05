import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NetworkError extends StatelessWidget {
  const NetworkError({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/nointernet.json',
              width: 500,
              height: 500,
              fit: BoxFit.cover,
            ),
            Text(
              'No Internet',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Lottie.asset(
              'assets/animations/earth.json',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              'Please check your internet connnection and, try again.',
              style: GoogleFonts.sora(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
