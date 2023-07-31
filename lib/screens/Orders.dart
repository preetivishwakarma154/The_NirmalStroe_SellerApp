import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nirmal_store/screens/SplashScreen.dart';
import '../page-1/modal/OrderModal.dart';
import '../page-1/modal/constant.dart';
import '../page-1/modal/product.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

Map OrderData = Map();

var orderLength;

class _OrdersState extends State<Orders> {
  Future OrderList() async {
    try {
      var headers = {
        'x-access-token': '$globalusertoken',
        'Cookie': 'ci_session=44362791e43a989d077364217474eb0a774c8486'
      };
      var request = http.MultipartRequest(
          'GET', Uri.parse('http://thenirmanstore.com/v1/seller/order_list'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var data = await response.stream.bytesToString();
      OrderData = jsonDecode(data);
      if (response.statusCode == 200) {
        if (OrderData['status'] == 1) {
          setState(() {
            print(OrderData);
            print(OrderData['data']);
          });
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  List<String> fiterlist = ["item 1", "item 2", "item 3"];
  List<String> orderStatusList = ['Recent', '1 week', '1 month', '3 month'];

  late FocusNode focusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode focusNode1 = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  var dropDownVlaue;

  var dropDownstatusVlaue;
  @override
  void initState() {
    OrderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Manage Orders",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 53,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            labelText: "Filter",
                            labelStyle: headingtextStyle,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: ThemeColoricon),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: ThemeColorYellow),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            )),
                        focusNode: focusNode,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: focusNode.hasFocus
                              ? ThemeColorYellow
                              : ThemeColortext,
                        ),
                        hint: Text("Select"),
                        elevation: 16,
                        style: TextStyle(color: ThemeColortext),
                        onChanged: (String? value) {
                          dropDownVlaue = value!;
                          // This is called when the user selects an item.
                          setState(() {
                            dropDownVlaue;
                          });
                        },
                        value: dropDownVlaue,
                        items: fiterlist
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      height: 53,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            labelText: "Sort",
                            labelStyle: headingtextStyle,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: ThemeColoricon),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: ThemeColorYellow),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            )),
                        focusNode: focusNode1,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: focusNode1.hasFocus
                              ? ThemeColorYellow
                              : ThemeColortext,
                        ),
                        hint: Text("Select"),
                        elevation: 16,
                        style: TextStyle(color: ThemeColortext),
                        onChanged: (String? value) {
                          dropDownstatusVlaue = value!;
                          // This is called when the user selects an item.
                          setState(() {
                            dropDownstatusVlaue;
                          });
                        },
                        value: dropDownstatusVlaue,
                        items: orderStatusList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: productTextStyle,
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
              OrderData.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: OrderData['data'].length,
                            itemBuilder: (context, index) => OrderModal(
                                  id: OrderData['data'][index]['id']==null?'':OrderData['data'][index]['id'],
                                  status: OrderData['data'][index]
                                      ['order_track_status']==null?'':OrderData['data'][index]
                                  ['order_track_status'],
                                  UserFirstName: OrderData['data'][index]
                                      ['first_name']==null?'':OrderData['data'][index]
                                  ['first_name'],
                                  UserLastName: OrderData['data'][index]
                                      ['last_name']==null?'': OrderData['data'][index]
                                  ['last_name'],
                                )),
                      ),
                    ),

              // OrderModal(id: '1', productName: "Folding Hex Key Set", status: 'Pending', color: ThemeColorBlueLink,),
              // OrderModal(id: '2', productName: "Circular Saw", status: 'Returned', color: ThemeColorPink,),
              // OrderModal(id: '3', productName: "Rental Service", status: 'Shipped', color:ThemeColorOrange ,),
              // OrderModal(id: '4', productName: "Tap Measure", status: 'Canceled', color: ThemeColorRed,),
              // OrderModal(id: '1', productName: "Folding Hex Key Set", status: 'Delivered', color: ThemeColorGreen),
              // OrderModal(id: '5', productName: "Circular Saw", status: 'Shipped', color: ThemeColorOrange,),
              // OrderModal(id: '6', productName: "Rental Service", status: 'Shipped', color:ThemeColorOrange ,),
              // OrderModal(id: '7', productName: "Tap Measure", status: 'Canceled', color: ThemeColorRed,),
            ],
          ),
        ),
      ),
    );
  }
}
