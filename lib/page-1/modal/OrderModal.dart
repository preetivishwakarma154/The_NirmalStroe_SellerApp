

import 'package:flutter/material.dart';
import 'package:nirmal_store/screens/sattlement.dart';


import '../../screens/Login.dart';
import '../../screens/orderDetails.dart';
import 'constant.dart';

class OrderModal extends StatefulWidget {
  const OrderModal(
      {Key? key,
      required this.id,
      required this.productName,
      required this.status,
      required this.color})
      : super(key: key);
  final String id, productName, status;
  final Color color;

  @override
  State<OrderModal> createState() => _OrderModalState();
}

class _OrderModalState extends State<OrderModal> {
  var dropDownVlaue;

  List<String> statusList = [
    'View Order',
    'Update Order',
    'Reject Order',
    'Order Invoice'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(
            color: ThemeColorDivider,
          ),
          borderRadius: BorderRadius.circular(5)),
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
                widget.id,
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
                widget.productName,
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
                "Status",
                style: headingtextStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.status,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: widget.color),
              ),
            ],
          ),
          VerticalDivider(
            color: ThemeColorDivider,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                
                context: context,
                builder: (context) =>

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      width: 50,
                      child: SimpleDialog(
                        shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(15)
                        ),
                      
                        
                       insetPadding: EdgeInsets.only(left:0,right: 10,bottom: 5,),
                        alignment: Alignment.centerRight,
                 contentPadding: EdgeInsets.only(top:5,bottom: 5) ,



                 children: <Widget>[

                          SimpleDialogOption(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StepperDemo(),));
                          },
                child:Text('View Order',style: productTextStyle,),
              ),
              SimpleDialogOption(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OrderDetails(),));

              },
              child:  Text('Update Order Status',style: productTextStyle),


              ), SimpleDialogOption(
              onPressed: () { },
              child:  Text('Reject Order',style: productTextStyle),


              ), SimpleDialogOption(
              onPressed: () { },
              child:  Text('Order Invoice',style: productTextStyle),


              )],
                ),
                    ),
              );
            },
            icon: Icon(Icons.arrow_circle_right_outlined,
              size: 25,
              color: ThemeColorYellow,),
          ),
          // Row(
          //   children: <Widget>[
          //     IconButton(
          //         icon: Icon(
          //           Icons.settings,
          //           color: Colors.black,
          //           size: 30.0,
          //         ),
          //         onPressed: () {
          //
          //           showDialog(
          //               context: context,
          //               builder: (BuildContext context) {
          //                 return AlertDialog(
          //                   title: Text('Country List'),
          //                   content: new ListView(
          //                     children: <Widget>[
          //                       new Column(
          //                         children: <Widget>[
          //                           new DropdownButton<String>(
          //                             items: <String>[
          //                               'A',
          //                               'B',
          //                               'C',
          //                               'D',
          //                               'E',
          //                               'F',
          //                               'G'
          //                             ].map((String value) {
          //                               return new DropdownMenuItem<String>(
          //                                 value: value,
          //                                 child: new Text(value),
          //                               );
          //                             }).toList(),
          //                             onChanged: (_) {},
          //                           ),
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //                 );
          //               });
          //         })
          //   ],
          // )
        ],
      ),
    );
  }
}
