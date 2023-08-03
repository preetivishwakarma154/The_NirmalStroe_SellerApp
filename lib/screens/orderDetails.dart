import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nirmal_store/screens/SplashScreen.dart';

import '../page-1/modal/Appbar.dart';
import '../page-1/modal/buttonModal.dart';
import '../page-1/modal/constant.dart';
import 'HomeScreen.dart';
import 'edit_details.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  Map OrderData = Map();

  var first_name,last_name,address,land_mark,city,state,postcode;

  var total = 0.0;

  var stoke;
  Future OrderDetail(order_id) async {
    try {
      var headers = {
        'x-access-token': '$globalusertoken',
        'Cookie': 'ci_session=ae27427a8824ccb20f4de4df5518a3d1788fa288'
      };
      var request = http.MultipartRequest('POST', Uri.parse('http://thenirmanstore.com/v1/seller/order_details'));
      request.fields.addAll({
        'order_id': order_id
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var data = await response.stream.bytesToString();
      setState(() {
        OrderData = jsonDecode(data);
      });

      if (response.statusCode == 200) {
        if (OrderData['status'] == 1) {
          setState(() {
            if(OrderData['data'][0]['order_track_status']==null){
              stoke= '';
            }else{
              if(stoke<3){
                stoke = 'In';
              }else{
                stoke = 'Out';
              }

            }


            if (OrderData['data'][0]['order_details'] == null) {
              print('total is null');

            }else{
              var dat = OrderData['data'][0]['order_details'].length;
              for (var i = 0; i < dat; i++) {
                double value = double.parse(
                    OrderData['data'][0]['order_details'][i]['price']);
                total = total + value;
              }

              print(total);
            }

            if(OrderData['data'][0]['customer_address'].length==0){
              first_name = '';
            }else {
              OrderData['data'][0]['customer_address']['first_name']==null?first_name= '':first_name = OrderData['data'][0]['customer_address']['first_name'];
              OrderData['data'][0]['customer_address']['last_name']==null?last_name= '':last_name = OrderData['data'][0]['customer_address']['last_name'];
              OrderData['data'][0]['customer_address']['address']==null?address= '':address = OrderData['data'][0]['customer_address']['address'];
              OrderData['data'][0]['customer_address']['land_mark']==null?land_mark= '':land_mark = OrderData['data'][0]['customer_address']['land_mark'];
              OrderData['data'][0]['customer_address']['city']==null?city= '':city = OrderData['data'][0]['customer_address']['city'];
              OrderData['data'][0]['customer_address']['state']==null?state= '':state = OrderData['data'][0]['customer_address']['state'];
              OrderData['data'][0]['customer_address']['postcode']==null?postcode= '':postcode = OrderData['data'][0]['customer_address']['postcode'];

          }

          });
        } else {
          print(OrderData);
        }
      }else {
        print(response.reasonPhrase);
      }

    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    OrderDetail(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    total = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarModal(),
      body: OrderData.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Manage Orders",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SingleChildScrollView(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(),
                              height: 80,
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Order ID", style: headingtextStyle),
                                      Text(
                                        OrderData['data'][0]['order_no'],
                                        style: productTextStyle,
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: ThemeColorDivider,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Customer Name",
                                        style: headingtextStyle,
                                      ),
                                      Row(
                                        children: [
                                          Text(first_name==null?'':first_name),

                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(last_name==null?'':last_name)
                                        ],
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: ThemeColorDivider,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Payment Mode",
                                        style: headingtextStyle,
                                      ),
                                      Text(
                                        OrderData['data'][0]
                                                    ['payment_method'] ==
                                                null
                                            ? ''
                                            : OrderData['data'][0]
                                                ['payment_method'],
                                        style: productTextStyle,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    title: Text(
                      "Shoping Address",
                      style: headingtextStyle,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: SingleChildScrollView(
                        child: Row(
                          children: [
                            Text(
                              address==null?'':address,
                              style: productTextStyle,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              land_mark==null?'':land_mark,
                              style: productTextStyle,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              city==null?'':city,
                              style: productTextStyle,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              postcode==null?'':postcode,
                              style: productTextStyle,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              state==null?'':state,
                              style: productTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    subtitleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14,
                        height: 1.2),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(),
                    height: 70,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Applicable Tax (GST)",
                              style: headingtextStyle,
                            ),
                            Text(
                              OrderData['data'][0]['tax'] == null
                                  ? ''
                                  : OrderData['data'][0]['tax'],
                              style: productTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Shoping",
                              style: headingtextStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              OrderData['data'][0]['delivery_charges'] == null
                                  ? ''
                                  : OrderData['data'][0]['delivery_charges'],
                              style: productTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Stock",
                              style: headingtextStyle,
                            ),
                            Text(
                              stoke==null?'':stoke,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color:stoke=='In'? ThemeColorGreen:ThemeColorRed),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15, top: 5),
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: ThemeColorbackground)),
                    height: MediaQuery.of(context).size.height * 0.26,
                    child: ListView.builder(
                      itemCount: OrderData['data'][0]['order_details'].length,
                      itemBuilder: (BuildContext context, int index) {
                        bool isEven = index % 2 == 0;

                        Color backgroundColor =
                            isEven ? Colors.white : ThemeColorbackground;
                        var i = index + 1;
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          height: 80,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 5, left: 20, right: 20, bottom: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Text(
                                    '$i.',
                                    style: productTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product ID",
                                      style: headingtextStyle,
                                    ),
                                    Text(
                                      OrderData['data'][0]['order_details']
                                                  [index]['id'] ==
                                              null
                                          ? ''
                                          : OrderData['data'][0]
                                              ['order_details'][index]['id'],
                                      style: productTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Product Name",
                                        style: headingtextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        OrderData['data'][0]['order_details']
                                            [index]['product_name'],
                                        style: productTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Amount",
                                      style: headingtextStyle,
                                    ),
                                    Text(
                                      OrderData['data'][0]['order_details']
                                                  [index]['price'] ==
                                              null
                                          ? ''
                                          : OrderData['data'][0]
                                              ['order_details'][index]['price'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(),
                  //   height: 80,
                  //   margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  //   padding: EdgeInsets.all(8),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Customer Name",
                  //             style: headingtextStyle,
                  //           ),
                  //           Text(
                  //             "Privin Grid",
                  //             style: productTextStyle,
                  //           ),
                  //         ],
                  //       ),
                  //       VerticalDivider(
                  //         color: ThemeColorDivider,
                  //       ),
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Product Image",
                  //             style: headingtextStyle,
                  //           ),
                  //           TextButton(
                  //             onPressed: () {},
                  //             child: Text(
                  //               "View Image",
                  //               style: TextStyle(
                  //                   fontSize: 14,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: ThemeColorBlueLink),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //       VerticalDivider(
                  //         color: ThemeColorDivider,
                  //       ),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           Text(
                  //             "Product Video",
                  //             style: headingtextStyle,
                  //           ),
                  //           TextButton(
                  //             onPressed: () {},
                  //             child: Text(
                  //               "Play video",
                  //               style: TextStyle(
                  //                   fontSize: 14,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: ThemeColorBlueLink),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  Container(
                    margin: EdgeInsets.only(left: 25, top: 12),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text("Order Summary",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColorBlueLink)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .02,
                          margin: EdgeInsets.only(
                              left: 0, right: 20, top: 10, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Grand Total:",
                                style: TextStyle(
                                    color: ThemeColortext,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rs. $total",
                                style: TextStyle(
                                    color: ThemeColortext,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    width: MediaQuery.of(context).size.width * 0.2855,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColorYellow,
                          minimumSize: Size.fromHeight(32),
                        ),
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
                        },
                        child: Text(
                          'CHANGE STATUS',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )),
                  )
                  // Container(
                  //   margin: EdgeInsets.only(left: 25, top: 12),
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.only(bottom: 10),
                  //             child: Text("Order Summary",
                  //                 style: TextStyle(
                  //                     fontSize: 14,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: ThemeColorBlueLink)),
                  //           ),
                  //           orderSummary(
                  //             title: "item(s) Subtotle:",
                  //             value: "Rs. 3299",
                  //           ),
                  //           orderSummary(
                  //             title: "Shipping:",
                  //             value: "Rs. 99",
                  //           ),
                  //           orderSummary(
                  //             title: "Coupan Discount:",
                  //             value: "Rs. 99",
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(top: 4, bottom: 4),
                  //             height: 1,
                  //             width: MediaQuery.of(context).size.width * 0.55,
                  //             color: ThemeColorDivider,
                  //           ),
                  //           orderSummary(
                  //             title: "Grand Total:",
                  //             value: "Rs. 3398",
                  //           ),
                  //         ],
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 5),
                  //         width: MediaQuery.of(context).size.width * 0.2855,
                  //         child: ElevatedButton(
                  //             style: ElevatedButton.styleFrom(
                  //               backgroundColor: ThemeColorYellow,
                  //               minimumSize: Size.fromHeight(32),
                  //             ),
                  //             onPressed: () {
                  //               //Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
                  //             },
                  //             child: Text(
                  //               'CHANGE STATUS',
                  //               style: TextStyle(
                  //                   fontSize: 10,
                  //                   color: Colors.black,
                  //                   fontWeight: FontWeight.w600),
                  //             )),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
    );
  }
}

class orderSummary extends StatelessWidget {
  const orderSummary({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 6, top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                title,
                style: TextStyle(
                    color: ThemeColortext,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 1,
              child: Text(
                value,
                style: TextStyle(
                    color: ThemeColortext,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
