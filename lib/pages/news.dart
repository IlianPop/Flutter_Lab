import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class News extends StatelessWidget {
  const News({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/left_arrow.png',
                        height: 22,
                        width: 22,
                      ),
                      Text(
                        "News",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF363B64),
                        ),
                      ),
                      Image.asset(
                        'assets/images/3_dots.png',
                        height: 24,
                        width: 22,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/images/chess.png',
                    height: 153,
                    width: 343,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (rect) => LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF3C6FD1), Color(0xFF7CA9FF)],
                        ).createShader(rect),
                        child: Text(
                          "WC Channel",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                      ),
                      SizedBox(width: 10),

                      Text(
                        "•",
                        style: TextStyle(
                          color: Color(0xFF363B64),
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "14 minutes ago",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color(0xFFA098AE),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        "Here’s what to expect from\nTuesday weather forecast",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color(0xFF363B64),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "The contrast and colors employed when designing user interface elements can have a huge impact on their accessibility to all end-users. Relying solely on color distinctions limits the ability of color blind individuals to use your product. Using light and dark colors combined with techniques such as cross-hatching to differentiate part of the interface make it more accessible for users with vision issues. This design mentality can result in more interesting and usable interfaces for all of your users.\n\nNature and art are resources for color inspiration in UI concepts that you would be wise to use.",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Color(0xFF363B64),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.white54, Colors.white],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Weather News",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/share_logo.png',
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Share it",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xFFA098AE),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
