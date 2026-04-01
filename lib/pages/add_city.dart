import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCity extends StatelessWidget {
  const AddCity({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SafeArea(
        child: Padding(
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
                    "Add City",
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
              SizedBox(height: 20),
              Container(
                height: 40,
                width: 343,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    Image.asset('assets/images/search_logo.png'),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          isCollapsed: true,
                          hintText: "Enter cities",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xFFA098AE),
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                height: 73,
                width: 343,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white54, Colors.white],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Image.asset(
                          'assets/images/geo_logo.png',
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kreuzberg",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF363B64),
                              ),
                            ),
                            Text(
                              "Berlin, Germany",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFA098AE),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/sun_cloud.png',
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 73,
                width: 343,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white54, Colors.white],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Image.asset(
                          'assets/images/geo_logo.png',
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kreuzberg",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF363B64),
                              ),
                            ),
                            Text(
                              "Berlin, Germany",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFA098AE),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/rain.png',
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 73,
                width: 343,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white54, Colors.white],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Image.asset(
                          'assets/images/geo_logo.png',
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kreuzberg",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF363B64),
                              ),
                            ),
                            Text(
                              "Berlin, Germany",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFA098AE),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/sun.png',
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 73,
                width: 343,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white54, Colors.white],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Image.asset(
                          'assets/images/geo_logo.png',
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kreuzberg",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF363B64),
                              ),
                            ),
                            Text(
                              "Berlin, Germany",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFA098AE),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/sun_cloud.png',
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
