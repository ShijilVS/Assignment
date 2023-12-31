
import "package:flutter/material.dart";
import 'package:mdf/extmdf.dart';
import 'package:mdf/intmdf.dart';
import 'package:mdf/main.dart';
import 'package:google_fonts/google_fonts.dart';

class Second extends StatelessWidget{
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       body: Center(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.only(bottom: 50),
               child: Text("TYPES OF MDF",style: customtxtstyle(),),
             ),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: SizedBox(
                 width: 300,
                 child: ElevatedButton(
                     style:ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                   padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                   textStyle:
                   MaterialStateProperty.all(const TextStyle(fontSize: 25,color: Colors.white))),
                     onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Interior(title: 'Interior Mdf',)));
                 }, child: Text("INTERIOR MDF",style: TextStyle(color: Colors.white),)),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: SizedBox(
                 width: 300,
                 child: ElevatedButton(
                     style:ButtonStyle(
                         backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                         padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                         textStyle:
                         MaterialStateProperty.all(const TextStyle(fontSize: 25,color: Colors.white))),
                     onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> Exterior(title: 'Exterior Mdf')));
                 }, child: Text("EXTERIOR MDF",style: TextStyle(color: Colors.white),)),
               ),
             )
           ],
         ),
       ),
      ),
    );
  }

}