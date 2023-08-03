import 'package:flutter/material.dart';

import '../../screens/productDetails.dart';
import 'constant.dart';
class product extends StatelessWidget {
  const product({
    super.key, required this.id, required this.productName, required this.mrp, required this.productid,
  });
  final String productid,id, productName, mrp;

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
              Text(
                  "ID",
                  style: headingtextStyle
              ),

              Text(productid,style: productTextStyle,),
            ],
          ),
          VerticalDivider(
            color: ThemeColorDivider,
          ),
          Expanded(
            flex: 2,
            child: 
            
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Name",
                    style: headingtextStyle,
                  ),
                  SizedBox(height: 5,),

                  Text(productName,style: productTextStyle,),
                ],
              ),
            ),
          ),
          VerticalDivider(
            color: ThemeColorDivider,
          ),
          Expanded(
            flex: 1,
            child: Column(
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
                Text("Rs. "+mrp,style: productTextStyle,),
              ],
            ),
          ),
          VerticalDivider(
            color: ThemeColorDivider,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(id: id,),));
              },
              icon: Icon(
                Icons.arrow_circle_right_outlined,
                size: 25,
                color: ThemeColorYellow,
              ))
        ],
      ),
    );
  }
}