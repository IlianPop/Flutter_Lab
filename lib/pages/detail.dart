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

class Detail extends StatefulWidget {
  const Detail({super.key});
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF3C6FD1), Color(0xFF7CA9FF)],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(
                          bottom: 20,
                          top: 20,
                          left: 25,
                          right: 15,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Image.asset(
                                    'assets/images/left_arrow_white.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                                Text(
                                  "Berlin, Germany",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/3_dots_white.png',
                                  height: 24,
                                  width: 24,
                                ),
                              ],
                            ),
                            Image.asset(
                              weatherLogo(
                                weatherMap!['list'][0]['weather'][0]['main'],
                              ),
                              height: 140,
                              width: 120,
                            ),
                            Column(
                              children: [
                                Text(
                                  weatherMap!['list'][0]['weather'][0]['description']
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  today,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 70),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 250,
                      left: 20,
                      right: 20,
                      child: Container(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xFF3C6FD1),
                                          Color(0xFF7CA9FF),
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        "Forecast",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
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
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 120),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Details",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF363B64),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.white54, Colors.white],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(
                              top: 25,
                              bottom: 25,
                              left: 10,
                              right: 40,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/blue_termometr.png',
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "72°",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF363B64),
                                      ),
                                    ),
                                    Text(
                                      "Fahrenheit",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFA098AE),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.white54, Colors.white],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(
                              top: 25,
                              bottom: 25,
                              left: 10,
                              right: 40,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/blue_wind.png',
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${weatherMap!['list'][0]['wind']['speed']} km/h",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF363B64),
                                      ),
                                    ),
                                    Text(
                                      "Pressure",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.white54, Colors.white],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(
                              top: 25,
                              bottom: 25,
                              left: 10,
                              right: 40,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/blue_sun.png',
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      weatherMap!['list'][0]['pop'].toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF363B64),
                                      ),
                                    ),
                                    Text(
                                      "UV index",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFA098AE),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.white54, Colors.white],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(
                              top: 25,
                              bottom: 25,
                              left: 10,
                              right: 40,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/blue_rain.png',
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${weatherMap!['list'][0]['main']['humidity']}%",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF363B64),
                                      ),
                                    ),
                                    Text(
                                      "Humidity",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
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
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Tips",
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
                        padding: EdgeInsetsGeometry.only(
                          top: 25,
                          bottom: 25,
                          left: 10,
                          right: 40,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/stars.png',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Its ok to hangout with your friend!",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color(0xFF363B64),
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
          ],
        ),
      ),
    );
  }
}
