import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../page-1/modal/constant.dart';

class Refer_Earn extends StatefulWidget {
  const Refer_Earn({Key? key}) : super(key: key);

  @override
  State<Refer_Earn> createState() => _Refer_EarnState();
}

class _Refer_EarnState extends State<Refer_Earn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ThemeColorDivider, width: 1)),
              child: Column(
                children: [
                  PlanContainer(context,"SILVER PLAN",'1200'),
                  SubscribeButton(ThemeColorYellow),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Divider(),
                  ),
                  subscribtionRow('assets/page-1/images/check-double-fill.png',"NO COMMISSION UP TO 5 LACS"),
                  subscribtionRow('assets/page-1/images/cross.png',"PRE ORDER BOOKING & COD BENEFITS"),
                  subscribtionRow('assets/page-1/images/cross.png',"OTHER OFFERS AND BENEFITS"),



                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeColorYellow,
                  border: Border.all(color: ThemeColorDivider, width: 1)),
              child: Column(
                children: [
                  PlanContainer(context, "PLATINUM PLAN", '2400'),
                  SubscribeButton(Colors.white),
                  subscribtionRow('assets/page-1/images/check-double-black.png', 'NO COMMISSION UP TO 5 LACS'),
                  subscribtionRow('assets/page-1/images/check-double-black.png', 'COD BENEFITS NO PRE-BOOKING FEE'),
                  subscribtionRow('assets/page-1/images/check-double-black.png', '29 SUBSCRIPTION SERVICES WITHOUT ANY COMMISSION'),
                  subscribtionRow('assets/page-1/images/check-double-black.png', 'PRE ORDER BOOKING'),
                  subscribtionRow('assets/page-1/images/check-double-black.png', 'MINIMUM SELLING TARGET AND INCENTIVES'),
                  subscribtionRow('assets/page-1/images/check-double-black.png', 'OTHER OFFERS AND BENEFITS'),
                ],
              ),


            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ThemeColorDivider, width: 1)),
              child: Column(
                children: [
                  PlanContainer(context,"GOLD PLAN",'1800'),
                  SubscribeButton(ThemeColorYellow),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Divider(),
                  ),
                  subscribtionRow('assets/page-1/images/check-double-fill.png',"NO COMMISSION UP TO 5 LACS"),
                  subscribtionRow('assets/page-1/images/cross.png',"PRE ORDER BOOKING & COD BENEFITS"),
                  subscribtionRow('assets/page-1/images/cross.png',"OTHER OFFERS AND BENEFITS"),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton SubscribeButton(color) {
    return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      minimumSize: const Size.fromHeight(35),
                    ),
                    onPressed: () {},
                    child: Text(
                      "SUBSCRIBE",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ));
  }

  Container PlanContainer(BuildContext context,planText,rupees) {
    return Container(
                  margin: EdgeInsets.only(bottom: 5, top: 5),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        planText,
                        style: productTextStyle,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Row(
                          children: [
                            Text(
                              "Rs."+rupees,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 8, left: 8),
                              width: 1,
                              height: 20,
                              color: ThemeColorDivider,
                            ),
                            Expanded(flex: 1, child: Text("Month"))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
  }

  Widget subscribtionRow(imagePath,text) {
    return Container(
      margin: EdgeInsets.only(top: 5,bottom: 5),
      child: Row(


                    children: [
                      Image(image: AssetImage(imagePath)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Text(text,style: TextStyle(
                            fontSize: 12
                          ),
                          ),
                        ),
                      )
                    ],
                  ),
    );
  }
}
