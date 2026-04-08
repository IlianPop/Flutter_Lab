import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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

class MyLocation extends StatefulWidget {
  const MyLocation({super.key});
  @override
  State<MyLocation> createState() => _MyLocation();
}

class _MyLocation extends State<MyLocation> {
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/left_arrow.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  Text(
                    "My Location",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF363B64),
                    ),
                  ),
                  SizedBox(width: 20),
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
                  padding: EdgeInsetsGeometry.only(left: 5, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(0, 10),
                        child: Image.asset(
                          'assets/images/sun_big_cloud.png',
                          height: 80,
                          width: 80,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Berlin, Germany",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            weatherMap!['list'][0]['weather'][0]['main'],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        "${weatherMap!['list'][0]['main']['temp'].toStringAsFixed(0)}°",
                        style: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
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
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Text(
                            "Wind",
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
                                        "Conditions",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Pressure",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
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
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/wind.png',
                                    height: 40,
                                    width: 38,
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Wind",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      Text(
                                        "${weatherMap!['list'][0]['wind']['speed']} km/h",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF363B64),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 50),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Barrometer",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xFFA098AE),
                                        ),
                                      ),
                                      Text(
                                        "${weatherMap!['list'][0]['main']['pressure']} mBar",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
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
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Text(
                            "Sun condition",
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
                                  Text(
                                    "Conditions",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Color(0xFFA098AE),
                                    ),
                                  ),
                                  Text(
                                    "UV index",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Color(0xFFA098AE),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sun",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF363B64),
                                    ),
                                  ),
                                  Text(
                                    "0.3",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF363B64),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Image.asset(
                                'Assets/Images/sun_conditions.png',
                                height: 61,
                                width: 294,
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
