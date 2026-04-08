import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lab3/pages/add_city.dart';
import 'package:lab3/pages/detail.dart';
import 'package:lab3/pages/my_location.dart';
import 'package:lab3/pages/news.dart';

String weatherLogo(String status) {
  switch (status) {
    case 'Clear':
      return 'assets/images/sun.png';
    case 'Clouds':
      return 'assets/images/cloud.png';
    case 'Rain':
      return 'assets/images/rain.png';
    default:
      return 'assets/images/sun.png';
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic>? weatherMap;
  String today = DateFormat('EEEE, d MMMM yyyy').format(DateTime.now());
  String city = "Berlin";
  Future<void> getWeather() async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?q=Berlin&appid=ea855618ddec6ddb2499386d645cdd69&units=metric',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        weatherMap = jsonDecode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    if (weatherMap == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyLocation()),
                      );
                    },
                    child: Text(
                      "Berlin, Germany",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF363B64),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddCity()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/dark_search_logo.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Detail()),
                  );
                },
                child: Container(
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
                                  "Chance of rain ${weatherMap!['list'][0]['pop']}%",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  weatherMap!['list'][0]['weather'][0]['main'],
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
                                weatherLogo(
                                  weatherMap!['list'][0]['weather'][0]['main'],
                                ),
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
                              "Berlin, Germany",
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
                              "${weatherMap!['list'][1]['main']['temp'].toStringAsFixed(0)}°",
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
                                  "${weatherMap!['list'][0]['pop']}%",
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
                                  weatherMap!['list'][0]['pop'].toString(),
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
                                  "${weatherMap!['list'][0]['wind']['speed']} km/h",
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => News()),
                          );
                        },
                        child: Container(
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
                                        weatherMap!['list'][0]['weather'][0]['main'],
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        today,
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
                                        DateFormat('HH:mm')
                                            .format(
                                              DateTime.parse(
                                                weatherMap!['list'][1]['dt_txt'],
                                              ),
                                            )
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Image.asset(
                                        weatherLogo(
                                          weatherMap!['list'][1]['weather'][0]['main'],
                                        ),
                                        height: 29.46,
                                        width: 28,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${weatherMap!['list'][1]['main']['temp'].toStringAsFixed(0)}°",
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
                                        DateFormat('HH:mm')
                                            .format(
                                              DateTime.parse(
                                                weatherMap!['list'][2]['dt_txt'],
                                              ),
                                            )
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Image.asset(
                                        weatherLogo(
                                          weatherMap!['list'][2]['weather'][0]['main'],
                                        ),
                                        height: 29.46,
                                        width: 28,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${weatherMap!['list'][2]['main']['temp'].toStringAsFixed(0)}°",
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
                                        DateFormat('HH:mm')
                                            .format(
                                              DateTime.parse(
                                                weatherMap!['list'][3]['dt_txt'],
                                              ),
                                            )
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Image.asset(
                                        weatherLogo(
                                          weatherMap!['list'][3]['weather'][0]['main'],
                                        ),
                                        height: 29.46,
                                        width: 28,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${weatherMap!['list'][3]['main']['temp'].toStringAsFixed(0)}°",
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
                                        DateFormat('HH:mm')
                                            .format(
                                              DateTime.parse(
                                                weatherMap!['list'][4]['dt_txt'],
                                              ),
                                            )
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Image.asset(
                                        weatherLogo(
                                          weatherMap!['list'][4]['weather'][0]['main'],
                                        ),
                                        height: 29.46,
                                        width: 28,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${weatherMap!['list'][4]['main']['temp'].toStringAsFixed(0)}°",
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
                                        DateFormat('HH:mm')
                                            .format(
                                              DateTime.parse(
                                                weatherMap!['list'][5]['dt_txt'],
                                              ),
                                            )
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Image.asset(
                                        weatherLogo(
                                          weatherMap!['list'][5]['weather'][0]['main'],
                                        ),
                                        height: 29.46,
                                        width: 28,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${weatherMap!['list'][5]['main']['temp'].toStringAsFixed(0)}°",
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
