import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
late ScrollController _controller;
  int _currentStockCode = 0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    int currentIndex = _controller.offset ~/ 56; // Adjust this value based on the height of your ListTile
    setState(() {
      _currentStockCode = currentIndex;
    });
  }

  String getStockData(int index) {
    // Replace this with your actual function for fetching stock data
    Map<int, String> stockData = {
      100: 'Stock 100: Company A, Price: \$120.00',
      101: 'Stock 101: Company B, Price: \$150.00',
      102: 'Stock 102: Company C, Price: \$90.00',
      // Add more stock data here
    };

    return stockData[index] ?? 'No data available for this stock code';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrolling Numbers'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ListView.builder(
                controller: _controller,
                itemCount: 1000,
                itemBuilder: (context, index) {
                  return Center(
                    child: ListTile(
                      title: ElevatedButton(
                        onPressed: () {  },
                        child: Text(
                          index.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: index == _currentStockCode ? Colors.green : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text('Current Stock Data: ${getStockData(_currentStockCode)}'),
          ],
        ),
      ),
    );
  }
}
