import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});
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
                    'assets/images/2_lines.png',
                    height: 24,
                    width: 24,
                  ),
                  Text(
                    "Berlin, Germany",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF363B64),
                    ),
                  ),
                  Image.asset(
                    'assets/images/dark_search_logo.png',
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF3C6FD1), Color(0xFF7CA9FF)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    bottom: 20,
                    top: 5,
                    left: 25,
                    right: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Chance of rain 60%",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Partly Cloudy",
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Transform.translate(
                            offset: Offset(0, 10),
                            child: Image.asset(
                              'assets/images/big_sun_cloud.png',
                              height: 110,
                              width: 110,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/light_geo_logo.png',
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Washington DC, USA",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "72°F",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/mini_rain.png',
                                height: 17,
                                width: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "10%",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/mini_sun.png',
                                height: 17,
                                width: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "0.5",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/mini_wind.png',
                                height: 17,
                                width: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "124 mp/h",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "News",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF363B64),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.white54, Colors.white],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.vertical(
                                top: Radius.circular(20),
                              ),
                              child: Image.asset(
                                'assets/images/border_chess.png',
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsetsGeometry.all(25),
                              child: Column(
                                children: [
                                  Text(
                                    "Here’s what to expect from Tuesday weather forecast",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF363B64),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "14 minutes ago",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      Text(
                                        "WC Channel",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF363B64),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Text(
                            "Today info",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF363B64),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.white54, Colors.white],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(25),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Partly cloudly",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "August, 10th 2020",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF363B64),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    "assets/images/3_lines.png",
                                    height: 24,
                                    width: 24,
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "2 PM",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Image.asset(
                                        "assets/images/sun.png",
                                        height: 29.46,
                                        width: 28,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "72°F",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xFF363B64),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "3 PM",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Image.asset(
                                        "assets/images/sun_cloud.png",
                                        height: 29.46,
                                        width: 28,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "70°F",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xFF363B64),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "4 PM",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Image.asset(
                                        "assets/images/sun_rain.png",
                                        height: 50,
                                        width: 45,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "60°F",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xFF363B64),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "5 PM",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Image.asset(
                                        "assets/images/cloud.png",
                                        height: 29.46,
                                        width: 28,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "75°F",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xFF363B64),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "6 PM",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Image.asset(
                                        "assets/images/rain.png",
                                        height: 29.46,
                                        width: 28,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "76°F",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xFF363B64),
                                        ),
                                      ),
                                    ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
