import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


import '../page-1/modal/constant.dart';
import '../utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final List<ChartData> chartData = [
    ChartData(7.00, 2750),
    ChartData(8.00, 3443),
    ChartData(9.00, 2345),
    ChartData(10.00, 4137),
    ChartData(11.00, 3537),
    ChartData(12.00, 3937),
    ChartData(13.00, 1500),
    ChartData(14.00, 2345),
    ChartData(15.00, 3343),
    ChartData(16.00, 4891),
    ChartData(17.00, 2300),
    ChartData(18.00, 4232),
  ];

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    TooltipBehavior _tooltipBehavior=TooltipBehavior();

    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Container(
          // autogroupodsebaE (UPx9VuDVaT14MHF32KoDSE)
          padding:
              EdgeInsets.fromLTRB(6 * fem, 12 * fem, 0 * fem, 9 * fem),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // dashboardhtA (41:1958)
                margin: EdgeInsets.fromLTRB(
                    134 * fem, 0 * fem, 0 * fem, 12 * fem),
                child: Text(
                  'Dashboard',
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 2 * ffem / fem,
                    letterSpacing: -0.4 * fem,
                    color: Color(0xff22272f),
                  ),
                ),
              ),
              Container(
                // statsQna (41:2003)
                margin: EdgeInsets.fromLTRB(
                    17 * fem, 0 * fem, 0 * fem, 9 * fem),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // autogroupagss9VG (UPxAPTZvEVpccqNVU8aGSS)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 18 * fem),
                      width: 96 * fem,
                      height: 50 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Today's Sales"),
                          Row(
                            children: [
                              Text(
                                "Rs.",
                                style: TextStyle(color: ThemeColoricon,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("49,434",style: TextStyle(
                                      fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),)
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      // past12hoursstatsNHU (41:2008)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 105 * fem, 0 * fem),
                      child: Text(
                        'Past 12 Hours Stats',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.3333333333 * ffem / fem,
                          color: Color(0xff000000),

                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                  child: Container(

                      child: SfCartesianChart(

                        backgroundColor:  Color.fromARGB(2, 243, 244, 246),
                        plotAreaBackgroundColor:Color.fromARGB(2, 243, 244, 246),
                        plotAreaBorderColor: ThemeColorDivider,


                        primaryXAxis: CategoryAxis

                          (

                        ),
                        primaryYAxis: NumericAxis(

                            minimum: 1250,
                            maximum: 5300,


                        ),


                        series: <ChartSeries<ChartData, double>>[
                          ColumnSeries<ChartData, double>(
                            dataLabelSettings: DataLabelSettings(
                              labelPosition: ChartDataLabelPosition.outside,
                              alignment: ChartAlignment.center,
                              textStyle: TextStyle(
                                fontSize: 8,
                                color: Colors.black54,

                              ),
                              isVisible: true,


                            ),

                              pointColorMapper:(ChartData data,  _) => data.color,


                              dataSource: chartData,


                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y),
                        ],
                      )
                  )
              ),



              Container(
                // metricsnf8 (41:1959)
                margin: EdgeInsets.fromLTRB(
                    21 * fem, 0 * fem, 27 * fem, 82 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // cardsvFY (41:1960)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 13 * fem),
                      width: double.infinity,
                      height: 61 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween
                        ,


                        children: [
                          OrderWidget(
                            imageUrl:
                                'assets/page-1/images/icon-MeE.png',
                            title: 'Ordered Delivered',
                            number: '14/',
                            widget: Text("17",

                              style: TextStyle(
                                fontSize: 12,

                            ),),
                          ),
                            OrderWidget(
                            imageUrl:
                            'assets/page-1/images/icon-NNi.png',
                            title: 'Total Orders',
                            number: '17',
                            widget:Image.asset(
                              'assets/page-1/images/trendingup-vjG.png',
                              width: 9.79 * fem,
                              height: 7.25 * fem,
                            )
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // cardsvFY (41:1960)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 13 * fem),
                      width: double.infinity,
                      height: 61 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween
                        ,


                        children: [
                          OrderWidget(
                            imageUrl:
                                'assets/page-1/images/icon-bA6.png',
                            title: 'Increase in Orders',
                            number: '4%',
                            widget: Image.asset(
                              'assets/page-1/images/trendingup-vjG.png',
                              width: 9.79 * fem,
                              height: 7.25 * fem,
                            )
                          ),
                            OrderWidget(
                            imageUrl:
                            'assets/page-1/images/icon-NsY.png',
                            title: 'Product Views',
                            number: '12%',
                            widget:Image.asset(
                              'assets/page-1/images/trendingup-2r2.png',
                              width: 9.79 * fem,
                              height: 7.25 * fem,
                            )
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.number,
    required this.widget,
  });
  final String imageUrl, title, number;
  final Widget widget;

  @override
  Widget build(BuildContext context) {


    return Container(
      width: MediaQuery.of(context).size.width*0.42,
        padding: EdgeInsets.symmetric(horizontal: 6,vertical: 8
        ),



        decoration: BoxDecoration(
          border:
          Border.all(color: Color(0xffdbdfe5)),
          borderRadius:
          BorderRadius.circular(8 ),
          boxShadow: [
            BoxShadow(
              color: Color(0x3dc4cad4),
              offset: Offset(0 , 2 ),
              blurRadius: 4 ,
            ),
          ],
        ),
      child: Row(


        children: [
          Image(
            image: AssetImage(imageUrl),
            width: 30,
            height: 30,

          ),
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 12 ,
                  fontWeight:
                  FontWeight.w500,

                  color: ThemeColoricon
                )

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,


                  children: [
                    Text(
                      number,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 3,),
                    widget
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
class ChartData{
  ChartData(this.x, this.y);
  final   x;
  final  y;
  Color color = Color(0xFFffd203);
}