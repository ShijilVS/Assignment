import 'package:assignment/provider/value_provider.dart';
import 'package:assignment/views/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment/utils/color_constants.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ProgressBarValue())
    ],child: Paymentsui(),)
  );
}

class Paymentsui extends StatefulWidget {
  @override
  State<Paymentsui> createState() => _PaymentsuiState();
}

class _PaymentsuiState extends State<Paymentsui> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'payment ui',
        theme: ThemeData(fontFamily: 'Poppins',primarySwatch:Palette.kToDark,
        ),home: Homepage());
  }
}