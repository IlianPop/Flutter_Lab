import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3C6FD1), Color(0xFF3C6FD1), Color(0xFF7CA9FF)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/cloud.png", width: 120),
            SizedBox(height: 20),
            Text(
              "Cloudy",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (rect) => LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white54, Colors.white],
              ).createShader(rect),
              child: Text(
                "Dont worry about \nthe weather we all here",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
