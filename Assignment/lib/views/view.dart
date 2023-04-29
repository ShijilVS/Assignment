import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment/provider/value_provider.dart';
import '../utils/color_constants.dart';
class Homepage extends StatefulWidget{
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int _selectedIndex = 1;
  final List<List<Map<String, dynamic>>> _buttonData = [
    [
    ],
    [
      {
        'image': 'https://www.femella.in/cdn/shop/products/25-02-2200488.jpg?v=1672481422',
        'amount': '₹799 deposited to:5749793484',
        'orderID': 'Order #137322',
        'date': 'Apr 26, 02:06 PM',
        'price': 100.0,
        'status': 'successful',
      },
      {
        'image': 'https://cdn.pixabay.com/photo/2016/12/06/09/31/blank-1886008__340.png',
        'amount': '₹799 deposited to:5749793484',
        'orderID': 'Order #1',
        'date': '2022-01-01',
        'price': 100.0,
        'status': 'successful',
      },
      {
        'image': 'https://cdn.pixabay.com/photo/2016/12/06/09/31/blank-1886008__340.png',
        'amount': '₹799 deposited to:5749793484',
        'orderID': 'Order #1',
        'date': '2022-01-01',
        'price': 100.0,
        'status': 'successful',
      },
    ]
  ];


  @override
  Widget build(BuildContext context) {

    TextStyle head = TextStyle(color: ColorConstant.mainBlack,fontSize:16,fontWeight: FontWeight.w500);
    TextStyle shead = TextStyle(color: ColorConstant.mainBlack,fontSize:14);
    TextStyle normal = TextStyle(color: ColorConstant.mainBlack,fontSize:12);
    TextStyle extrasmall = const TextStyle(color: Colors.black87,fontStyle: FontStyle.italic,fontSize:10);
    TextStyle lite = const TextStyle(color: Colors.black45,fontSize:14);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(leading: const Icon(Icons.arrow_back),title: const Center(child: Text("Payments")),actions: const [Icon(Icons.info_outline)],),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children:[ Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        title: Text(("Transaction Limit"),style: head,),
                        subtitle: const Text("A free limit up to which you will receive the online payment directly in your bank"),
                      ),
                      ListTile(
                        title: Consumer<ProgressBarValue>(
                          builder: (context, progressBarValue, child) {
                            return LinearProgressIndicator(
                              value: progressBarValue.value,
                            );
                          },
                        ),
                        subtitle: Consumer<ProgressBarValue>(
                          builder: (context, progressBarValue, child) {
                            return Text("${(progressBarValue.value * 50000).round()} left out of ₹50,000");
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          children: [
                            SizedBox(height:25,width:120,child: ElevatedButton(onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: AlertDialog(
                                  title: const Text("Enter value"),
                                  content: SingleChildScrollView(
                                    child: TextField(
                                      onChanged:  (value) {
                                        double newValue = double.tryParse(
                                            value) ?? 0;
                                        Provider.of<ProgressBarValue>(
                                            context, listen: false)
                                            .updateValue(newValue / 50000);
                                      } ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text("OK"),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }, child: const Text("Increase limit"),),
                            )],
                        ),
                      )],
                  )
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Default method',style: shead,),
                    TextButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("Bank Account",style: lite,),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward_ios,color: Colors.black45,),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payment Profile',style: shead,),
                    TextButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("Bank Account",style: lite,),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward_ios,color: Colors.black45,),
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(thickness: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payment Overview',style:head),
                    TextButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("Life Time",style: lite,),
                          const SizedBox(width: 8),
                          const Icon(Icons.expand_more,color: Colors.black45,),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorConstant.mainOrange),
                      height: 80,
                      width: 150,
                      child: const ListTile(
                        title: Text("AMOUNT ON HOLD",style:TextStyle(fontSize: 12,color: Colors.white)),
                        subtitle: Text("₹0",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorConstant.mainGreen),
                      height: 80,
                      width: 150,
                      child: const ListTile(
                        title: Text("AMOUNT RECEIVED",style: TextStyle(fontSize: 12,color: Colors.white)),
                        subtitle: Text("₹13,332",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                  child: Row(
                    children: [
                      Text("Transactions",style: head),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < 3; i++)
                      SizedBox(
                        height: 25,
                        child: ElevatedButton(
                          onPressed: () => setState(() => _selectedIndex = i),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            backgroundColor:
                            _selectedIndex == i ? ColorConstant.mainBlue : ColorConstant.mainWhite,
                          ),
                          child: Text(
                            ['On hold', 'Payouts (${_buttonData[1].length})', 'Refunds'][i],
                            style: TextStyle(
                              color: _selectedIndex == i ? Colors.white : Colors.black45,
                            ),
                          ),
                        ),
                      ),

                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _buttonData[_selectedIndex].length,
                    itemBuilder: (context, index) {
                      final item = _buttonData[_selectedIndex][index];
                      return SizedBox(
                          height: 100,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  decoration:BoxDecoration(border: Border.all(color: Colors.black12)),height:40,width:40,child: Image.network(item['image'],fit: BoxFit.fill,),),
                                title: Text(item['orderID'],style: normal,),
                                subtitle: Text(item['date'],style: const TextStyle(fontSize: 10,color: Colors.black38),),
                                trailing: SizedBox(
                                  width:80,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10,left: 25),
                                        child: Text('₹${item['price']}',style: TextStyle(fontSize: 14,color: ColorConstant.mainBlue,fontWeight: FontWeight.w600),),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.circle,color: ColorConstant.mainGreen,size: 10,),
                                          Text(item['status']),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(width: 15,),
                                  Text(item['amount'],style:extrasmall,textAlign: TextAlign.center),
                                ],
                              )
                              ,const Divider(thickness: 1,)
                            ],
                          )
                      );
                    },
                  ),
                )
              ]
          ),
        )
    );
  }
}