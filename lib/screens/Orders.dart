import 'package:flutter/material.dart';

import '../page-1/modal/OrderModal.dart';
import '../page-1/modal/constant.dart';
import '../page-1/modal/product.dart';
class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  List<String> fiterlist = [
    "item 1",
    "item 2",
    "item 3"
  ];
  List<String> orderStatusList =[
    'Recent',
    '1 week',
    '1 month',
    '3 month'
  ];

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
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
                margin: EdgeInsets.only(top: 10,bottom: 10),


                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      height: 53,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Filter",

                            labelStyle: headingtextStyle,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: ThemeColoricon),
                              borderRadius: const BorderRadius.all(
                               Radius.circular(5.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: ThemeColorYellow),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            )),
                        focusNode: focusNode,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: focusNode.hasFocus ? ThemeColorYellow : ThemeColortext,
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
                        items: fiterlist.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),

                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      height: 53,
                      width: MediaQuery.of(context).size.width*0.3,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            labelText: "Sort",

                            labelStyle: headingtextStyle,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: ThemeColoricon),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: ThemeColorYellow),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            )),
                        focusNode: focusNode1,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: focusNode1.hasFocus ? ThemeColorYellow : ThemeColortext,
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
                        items: orderStatusList.map<DropdownMenuItem<String>>((String value) {
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

              OrderModal(id: '1', productName: "Folding Hex Key Set", status: 'Pending', color: ThemeColorBlueLink,),
              OrderModal(id: '2', productName: "Circular Saw", status: 'Returned', color: ThemeColorPink,),
              OrderModal(id: '3', productName: "Rental Service", status: 'Shipped', color:ThemeColorOrange ,),
              OrderModal(id: '4', productName: "Tap Measure", status: 'Canceled', color: ThemeColorRed,),
              OrderModal(id: '1', productName: "Folding Hex Key Set", status: 'Delivered', color: ThemeColorGreen),
              OrderModal(id: '5', productName: "Circular Saw", status: 'Shipped', color: ThemeColorOrange,),
              OrderModal(id: '6', productName: "Rental Service", status: 'Shipped', color:ThemeColorOrange ,),
              OrderModal(id: '7', productName: "Tap Measure", status: 'Canceled', color: ThemeColorRed,),


            ],
          ),
        ),
      ),

    );
  }
}
