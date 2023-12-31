import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Onboarding(),
    );
  }

}
TextStyle customtxtstyle() => GoogleFonts.poppins(
  textStyle: TextStyle(fontSize: 30, letterSpacing: .5,fontWeight: FontWeight.w500),
);