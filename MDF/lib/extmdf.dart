import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mdf/main.dart';

class Exterior extends StatefulWidget {
  Exterior({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ExteriorState createState() => _ExteriorState();
}

class _ExteriorState extends State<Exterior> {
  List<dynamic> data = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbxHDyfQnSFM-pi1zJt8JDvl9zkrqLrYSLX6O6rAY4fsAK0iYKg0aj6niT1bb1r3eIhzcA/exec'));

    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        height: 500,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50,bottom: 50),
              child: Text("Scroll to view the Data",style: TextStyle(fontSize: 20),),
            ),
            Expanded(
              child: ListWheelScrollView(
                itemExtent: 50,
                onSelectedItemChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: <Widget>[
                  for (var i = 0; i < data.length; i++)
                    SizedBox(
                      width: 300,
                      child: ListTile(
                        title: ElevatedButton(
                          onPressed: () {},
                          child: Text('Code: ${data[i]['excode']}'),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (i == _selectedIndex) return Colors.green;
                                return Colors.white60;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: data.isNotEmpty
                  ? Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Stock: ${data[_selectedIndex]['exstock']}',
                  style: customtxtstyle(),
                ),
              )
                  : CircularProgressIndicator(), // Show loading indicator while data is being fetched
            ),
          ],
        ),
      ),
    );
  }
}
