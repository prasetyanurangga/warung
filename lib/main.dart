import 'package:flutter/material.dart';
import 'package:warung/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition : Transition.fadeIn,
      title: 'Hava',
      theme: ThemeData(
        textTheme: GoogleFonts.rubikTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: Color(0xFF030303))),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}