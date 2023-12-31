import 'package:flutter/material.dart';
import 'package:mdf/main.dart';
import 'package:mdf/second.dart';

class Onboarding extends StatefulWidget{
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.center,

                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text("MDF",style: customtxtstyle(),),
                  Text("Stocks",style: customtxtstyle(),),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: SizedBox(
                      width: 250,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                      }, child: Icon(Icons.arrow_right_alt,size: 50,),),
                    ),
                  )
                ],
              ),
            )
    );
  }
}