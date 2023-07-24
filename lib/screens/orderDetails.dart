import 'package:flutter/material.dart';

import '../page-1/HomeScreen.dart';
import '../page-1/modal/buttonModal.dart';
import '../page-1/modal/constant.dart';
import 'edit_details.dart';
class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(),
                      height: 80,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ID", style: headingtextStyle),
                              Text(
                                "1",
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Product Name",
                                style: headingtextStyle,
                              ),
                              Text(
                                "Folding Hex Key Set",
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "MRP",
                                style: headingtextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Rs. 3299  ",
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Stock",
                                style: headingtextStyle,
                              ),
                              Text(
                                "In",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: ThemeColorGreen),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(),
                      height: 80,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order Id",
                                style: headingtextStyle,
                              ),
                              Text(
                                "55467789CV",
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Category",
                                style: headingtextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Machinery",
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Sub - Category",
                                style: headingtextStyle,
                              ),
                              Text(
                                "Machinery",
                                style: productTextStyle,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(),
                      height: 80,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
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
                                "18%",
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
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
                                "Rs.XX",
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Payment Mode",
                                style: headingtextStyle,
                              ),
                              Text(
                                "COD",
                                style: productTextStyle,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(),
                      height: 80,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Customer Name",
                                style: headingtextStyle,
                              ),
                              Text(
                                "Privin Grid",
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Product Image",
                                style: headingtextStyle,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "View Image",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeColorBlueLink),
                                ),
                              )
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Product Video",
                                style: headingtextStyle,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Play video",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeColorBlueLink),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left:25,bottom: 10),

              title: Text(
                "Shoping Address",
                style: headingtextStyle,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 15,),
                child: Text(
                  "2004/C SechmeNo 14, Vijay Nagar, Jabalpur, Madhya Predesh 482002",
                  style: productTextStyle,
                ),
              ),
              subtitleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14,
                height: 1.2

              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 25,top: 12),
              width: MediaQuery.of(context).size.width,

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("Order Summary", style:TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ThemeColorBlueLink)),
                    ),
                      orderSummary(title: "item(s) Subtotle:",value: "Rs. 3299",),
                      orderSummary(title: "Shipping:",value: "Rs. 99",),
                      orderSummary(title: "Coupan Discount:",value: "Rs. 99",),
                      Container(
                        margin: EdgeInsets.only(top: 4,bottom: 4),
                        height: 1,
                        width: MediaQuery.of(context).size.width*0.55,
                        color: ThemeColorDivider,
                      ),

                      orderSummary(title: "Grand Total:",value: "Rs. 3398",),




                  ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    width: MediaQuery.of(context).size.width*0.2855,

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
                  ),
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}

class orderSummary extends StatelessWidget {
  const orderSummary({
    super.key, required this.title, required this.value,
  });
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.62,
      margin: EdgeInsets.only(bottom: 6,top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            flex: 1,
              child: Text(title,style:  TextStyle(color: ThemeColortext, fontSize: 14,fontWeight: FontWeight.bold ),)),Expanded(
            flex: 1,
              child: Text(value,style:  TextStyle(color: ThemeColortext, fontSize: 14,fontWeight: FontWeight.bold ),)),



        ],
      ),
    );
  }
}
